#### Ubuntu LTS download
   <https://www.ubuntu.com/download/alternative-downloads>
#### Rufus (iso to usb)사용하여 다운받은 Ubuntu.iso를 부팅용 USB로 생성
   <https://rufus.akeo.ie/>
#### 사용자 홈 하위 폴더명 영문으로 바꾸기 (/home/user/다운로드, 음악, 문서, ...)
~~~bash
export LANG=C
xdg-user-dirs-gtk-update
~~~

#### Zshell 설치
~~~bash
sudo apt-get install zsh
~~~
#### Oh my zsh 설치
Ref.  <https://nolboo.kim/blog/2015/08/21/oh-my-zsh/>
~~~bash
curl -L http://install.ohmyz.sh | sudo sh
sudo chown -R user:user .oh-my-zsh .zshrc
~~~
#### Powerlevel9k theme for Oh-my-zsh
Ref. <https://github.com/bhilburn/powerlevel9k>
~~~bash
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

vi ~/.zshrc # 아래 추가
export TERM="xterm-256color"
ZSH_THEME="powerlevel9k/powerlevel9k"
~~~

#### P9k 폰트 설치
~~~bash
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
xset q
mv PowerlineSymbols.otf ~/.local/share/fonts
fc-cache -vf ~/.local/share/fonts/
mv 10-powerline-symbols.conf ~/.config/font-manager/conf.d  # target 경로는 우분투 버전에 따라 다를 수 있음
~~~
* X Window 재시작 (터미널 에뮬레이트 기본 글꼴로 수정)

#### Antigen 설치 (zsh plugin manager)
Ref. https://github.com/zsh-users/antigen
* vi ~/.zshrc 에 아래 추가 (~/bin/antigen.zsh를 설치 한 경우)
~~~bash
# The plugin manager for zsh.
source ~/bin/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply
~~~
* 기타 유용한 플러그인
  * 등록된 alias가 있다면 힌트로 알려줌: https://github.com/djui/alias-tips

#### git 설치
~~~bash
sudo apt-get install git gitk

# 로그인 정보 캐시 (1년간 유효)
git config credential.helper store 'cache --timeout=31536000'
git config --global credential.helper 'cache --timeout=31536000'
~~~
#### GUI git client
Ref. https://git-scm.com/download/gui/linux
* GitKraken 무료버전 추천
* SCM Breeze (command-line git alias)
  * 사용법: https://www.youtube.com/watch?v=iKdp6uBfrvc
~~~bash
git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh
source ~/.zshrc   # or source ~/.bashrc
~~~

#### Java & Maven & Gradle 설치
Ref. http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
~~~bash
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
java -version
sudo apt-get install maven
sudo apt-get install gradle
~~~

#### Node Version Manager 설치
Ref. https://github.com/creationix/nvm
~~~bash
# NVM install
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
source ~/.bashrc

# node install
nvm install 6 or 7 or 8 or node (for latest)

# 사용할 노드 버전 선택
nvm use 6 or 7 or 8 or node (for latest)
node -v

# 새로운 터미널 열때마다 8을 쓰고 싶은경우
nvm alias default 8
~~~

#### gcc 6.3.x 설치
Ref. https://gist.github.com/application2000/73fd6f4bf1be6600a2cf9f56315a2d91
~~~bash
sudo apt-get update && \
sudo apt-get install build-essential software-properties-common -y && \
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
sudo apt-get update && \
sudo apt-get install gcc-snapshot -y && \
sudo apt-get update && \
sudo apt-get install gcc-6 g++-6 -y && \
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6
gcc -v
~~~

#### 개발 라이브러리 설치
~~~bash
sudo apt-get -y install libcairo2-dev libjpeg-dev libgif-dev libgtest-dev 
openssl libssl-dev libqt4-dev qt4-dev-tools **\** libncurses5**-dev libcurl4-openssl-dev**
~~~

#### cmake 3.6.x with SSL 설치
Ref. http://embedonix.com/articles/linux/installing-cmake-3-5-2-on-ubuntu/
~~~
wget <http://www.cmake.org/files/v3.6/cmake-3.6.1.tar.gz>
tar -zxvf cmake-3.6.1.tar.gz
cd cmake-3.6.1
vi bootstrap # cmake_options 검색 후 -DCMAKE_USE_OPENSSL=ON 추가
./configure --qt-gui
vi CMakeCache.txt # BUILD_QtDialog:BOOL=ON 수정
./bootstrap --prefix=/usr
make -j2 && sudo make install && cd .. && rm -rf ~/cmake-3.6.1 ~/cmake-3.6.1.tar.gz
cmake -version
~~~

#### IntelliJ 설치
Ref. https://www.jetbrains.com/idea/download/#section=linux

#### RubyGems 설치 (package manager)
~~~
sudo apt-get install rubygems
~~~

#### Tmux 설치 (스크린 분할 유틸)
~~~
sudo apt-get install tmux
sudo gem install tmuxinator
vi ~/.tmux.conf # 설정 편집(http://junho85.pe.kr/320)
vi ~/.zshrc # 상단에 아래 구문 삽입해야 tmux new -s alpha 실행시 경고가 안남.
export TERM="xterm-256color"
~~~

* 사용법: https://bluesh55.github.io/2016/10/10/tmux-tutorial/
~~~
tmux ls   (세션 목록보기)
tmux new -s alpha  (새로운 세션 생성)
<prefix> d   (세션 두고 나오기)
tmux attach -t alpha    (다시 세션 진입)
<prefix> c   (신규 윈도우 생성)
<prefix> ,   (원도우 이름 변경)
<prefix> p   (이전 윈도우로 이동)
<prefix> n   (다음 윈도우로 이동)
<prefix> w  (모든 윈도우 이름 보기)
<prefix> %  (윈도우 세로 분할)
<prefix> "   (윈도우 가로 분할)
<prefix> q + 숫자 (팬 이동, 마우스 or 화살키도 됨)
<prefix> z   (해당 위치의 윈도우 최대화/이전상태로)
<prefix> <alt>-방향키 (현재 팬의 사이즈 조정, 마우스도 됨)
<prefix> + [    (스크롤모드)
복사는 화면 최대화 후 쉬프트 + 마우스 드래그 하면 됨
~~~

#### pushover.net 설치 (푸시 알림 서비스 - 유료)
* Ref. https://pushover.net/
* 시간이 많이 걸리는 작업시 유용함
~~~
$ vi ~/.zshrc
function push {
    curl -s -F "token=ax9ejs866gap8bsiupedivxow38qdn" \
            -F "user=ukujdnkopxyjn4e3ag7zqjqsouve4t" \
            -F "title=완료알림" \
            -F "message=$1" https://api.pushover.net/1/messages.json
}

$ sleep 3; push "Hello~"  # 3초 후 메시지 보냄
~~~

#### pgAdmin4 설치
~~~
sudo apt-get install python-pip python-dev build-essential
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv
wget <https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v2.0/pip/pgadmin4-2.0-py2.py3-none-any.whl>
sudo pip install pgadmin4-2.0-py2.py3-none-any.whl
~~~
* 실행하기
~~~
sudo python /usr/local/lib/python2.7/dist-packages/pgadmin4/pgAdmin4.py 
~~~
* http://127.0.0.1:5050 in your browser.

#### Vim 설치
~~~
sudo apt-get install vim
~~~

#### Vundle & plugin 설치
   https://bluesh55.github.io/2016/10/09/vim-ide/
   https://vimawesome.com/
   https://github.com/amix/vimrc
   http://sourcefoundry.org/hack/

#### webpack 설치 (JavaScript 모듈화 도구)
   http://d2.naver.com/helloworld/0239818
   https://webpack.github.io/docs/troubleshooting.html#not-enough-watchers

#### Node Process Manager (PM2)
   http://pm2.keymetrics.io/

#### 우분투 단축키 수정
* Ctrl+Space 한/영 단축키 제거 
  * 한/영 전환은 Super+Space만 사용, ctrl+space는 eclipse 단축키와 충돌함
  * Super키(윈도우키) 누르고 Fcitx 검색 후 실행 - 전역설정 - 입력기 전환 - 단축키 제거 (ESC)
* Super키 눌렀을때 "사용자 컴퓨터에서 검색" 기능 비활성화 (하단 링크 참조)
  * Super + Space로 한/영 전환시 사용자 컴퓨터에서 검색창이나 몇몇 장소에서 Super키가 발동하여 의도치 않게 한/영 전환 안되는 문제 해결
  * "사용자 컴퓨터에서 검색" 기능을 자주 쓴다면 다른키를 할당해서 사용하는게 좋음 (Super + z 추천)
  * https://askubuntu.com/questions/105558/how-do-i-disable-the-super-key
  * -> Launcher: Key to show the Dash, Launcher and Help Overlay 항목 키 수정

#### Terminal 단축키
~~~
Ctrl + Alt + T: 바탕화면에서 터미널 실행
Ctrl + Shift + N: 터미널내에서 새 터미널 실행
Ctrl + Shift + T: 터미널내에서 새탭 실행
Ctrl + Shift + W: 현재 탭 종료
Crtl + plus / minus : 줌 인/아웃
Ctrl + Shift + Q: 현재 터미널 종료 (탭포함)
Ctrl + Super + Left/Right/Up/Down: 창크기 좌/우/최대/최소 조정
Ctrl + PageUp/Down or Alt + 숫자: 탭 이동
Ctrl + Shift +F: 터미널내 문자열 검색
~~~

#### 유용한 툴
* NixNode (evernote 연동 어플)
  * https://github.com/baumgarr/nixnote2
* glances (advanced top 어플)
  * https://github.com/nicolargo/glances
* ranger
  * https://ranger.github.io/
* powerline
  * tmux/powerline.conf 추가 (~/.tmux.conf)
* 상단 인디케이터
  * sudo apt-get install indicator-cpufreq 
  * sudo apt-get install my-weather-indicator
* 유니티 런처에서 아이콘 클릭시 창최소화 하기 (터미널에서 실행)
  * gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true
* 다양한 툴
  * http://www.omgubuntu.co.uk/2016/04/10-things-to-do-after-installing-ubuntu-16-04-lts
* 부팅시 시작 프로그램 관리
  * sudo apt-get install bum
  * sudo bum
* git 설정
  * 똑똑한 diff: https://item4.github.io/2016-06-14/Make-Smarter-Git-Diff/
  * 설치법: http://www.kirknodeng.com/?p=504
* 마우스 휠 속도 올리기 및 버튼으로 창 닫기 및 뒤로가기
  * Ref. http://lhb0517.tistory.com/entry/Ubuntu-1604-%EC%9A%B0%EB%B6%84%ED%88%AC%EC%97%90%EC%84%9C-%ED%9C%A0%EC%8A%A4%ED%81%AC%EB%A1%A4-%EC%86%8D%EB%8F%84-%EB%B0%8F-5%EB%B2%84%ED%8A%BC-%EB%A7%88%EC%9A%B0%EC%8A%A4-%EC%84%A4%EC%A0%95-imwheel
~~~
sudo apt-get install -y imwheel

vi ~/.imwheelrc   # 아래 내용 추가 후 저장
".*"
None, Up, Button4,3
None, Down, Button5,3
Control_L, Up, Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L, Up, Shift_L|Button4
Shift_L, Down, Shift_L|Button5

# 적용하기
imwheel --kill -buttons "4 5"

# 컴퓨터를 재시작 할때마다 imwheel 시작하기 (아래 방법 안됨)
sudo vi /etc/X11/imwheel/startup.conf에서 아래 라인 추가 또는 수정
IMWHEEL_START = 1
IMWHEEL_PARAMS='-b "0 0 0 0 4 5"'
~~~
* 시작 프로그램 등록
  * 우분투 아이콘 클릭하여 검색: "시작프로그램"
  * 추가 버튼 클릭하고 command란에 실행할 명령어 입력
* 스크린캡쳐 툴 (영역지정 가능)
  * Ref. http://shutter-project.org/downloads/third-party-packages/
~~~
sudo apt-get install shutter
~~~
* Markdown 편집기 for linux (Typora)
  * https://typora.io/#linux
* 크롬 확장 프로그램 설치
  * Momentum: 브라우저 새탭시 멋진 배경사진, 시계, Todo보여줌
  * JSON formatter
  * Postman: HTTP GET/POST 테스트
  * Line messenger
  * Stylish: 사이트별 테마 적용가능 (베터리 절약을 위해 블랙 테마 적용)
* Yubikey 인식하기
  * sudo service pcscd restart
  * https://justrocketscience.com/post/install-card-reader-ubuntu-vm
  * https://github.com/FreeRDP/FreeRDP
  * https://superuser.com/questions/603920/how-to-connect-to-windows-with-xfreerdp-and-smartcard
  * http://tipsonubuntu.com/2017/01/24/install-remmina-1-2-0-ubuntu-16-04/