NGINX_VERSION=1.20.2
INSTALL_PATH=/Users/user/apps/nginx
ZLIB=1.2.11
PCRE=8.45
SSL=openssl-1.1.1l
cd ~;mkdir temp_directory;cd temp_directory
wget https://jaist.dl.sourceforge.net/project/libpng/zlib/$ZLIB/zlib-$ZLIB.tar.gz
tar xvfz zlib-$ZLIB.tar.gz
cd zlib-$ZLIB && ./configure && make && cd ..
wget https://jaist.dl.sourceforge.net/project/pcre/pcre/$PCRE/pcre-$PCRE.tar.gz
tar xvfz pcre-$PCRE.tar.gz
cd pcre-$PCRE && ./configure && make && cd ..
wget https://www.openssl.org/source/$SSL.tar.gz
tar xvfz $SSL.tar.gz
cd $SSL && ./config && make && cd ..
wget http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz
tar xvfz nginx-$NGINX_VERSION.tar.gz
cd nginx-$NGINX_VERSION
./configure --with-http_realip_module --with-zlib=../zlib-$ZLIB --with-pcre=../pcre-$PCRE --with-openssl=../$SSL --with-http_ssl_module --with-http_v2_module --with-debug --prefix=$INSTALL_PATH
make
make install
cd ../.. && rm -rf temp_directory
echo "Installed!"
