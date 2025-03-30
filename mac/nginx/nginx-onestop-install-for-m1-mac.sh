INSTALL_PATH=/Users/user/apps/nginx
ZLIB=1.3.1
PCRE2=10.45
SSL=3.4.1
NGINX=1.26.3

# initialize
cd ~;mkdir temp_directory;cd temp_directory

# ZLIB
echo '============= ZLIB (start) ============'
wget https://github.com/madler/zlib/releases/download/v$ZLIB/zlib-$ZLIB.tar.gz
tar xvfz zlib-$ZLIB.tar.gz
cd zlib-$ZLIB && ./configure && make && cd ..
echo '============= ZLIB (done) ============'

# PCRE
echo '============= PCRE (start) ============'
wget https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.45/pcre2-$PCRE2.tar.gz
tar xvfz pcre2-$PCRE2.tar.gz
cd pcre2-$PCRE2 && ./configure && make && cd ..
echo '============= PCRE (done) ============'

# SSL
echo '============= SSL (start) ============'
wget https://github.com/openssl/openssl/releases/download/openssl-$SSL/openssl-$SSL.tar.gz
tar xvfz openssl-$SSL.tar.gz
cd openssl-$SSL && ./config && make && cd ..
echo '============= SSL (done) ============'

# NGINX
echo '============= NGINX (start) ============'
wget http://nginx.org/download/nginx-$NGINX.tar.gz
tar xvfz nginx-$NGINX.tar.gz
cd nginx-$NGINX
./configure --with-http_realip_module --with-zlib=../zlib-$ZLIB --with-pcre=../pcre2-$PCRE2 --with-openssl=../openssl-$SSL --with-http_ssl_module --with-http_v2_module --with-debug --prefix=$INSTALL_PATH
make
make install
echo '============= NGINX (done) ============'

# clean up
cd ../.. && rm -rf temp_directory

echo "Installed!"
