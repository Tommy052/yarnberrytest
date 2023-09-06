Yanr berry 시작 방법
react 프로젝트를 생성한다
1. npx create-react-app my-app --template typescript

node_modules 과 yarn.lock 삭제를 한다 npm 을 사용하여 package-lock.json 파일이 있다면 이 파일을 삭제해주세요.
2. rm -rf node_modules rm -rf yarn.lock

yarn 버전 세팅
3.yarn set version berry
명령어를 입력하고 나면 .yarn 디렉토리와 .yarnrc.yml 파일이 생성됩니다.

패키지 설치
4.yarn
설치를 하고 나면 기존과는 다르게 node_modules 디렉토리가 생기지 않고, 패키지들은 모두 .yarn/cache 안에 zip 파일로 설치된 것을 볼 수 있습니다.

타입스크립트 플러그인
5.yarn plugin import typescript
타입스크립트 플러그인을 Import 해줍니다. 이 플러그인은 자체 types를 포함하지 않는 패키지를 추가할 때 @types/ 패키지를 package.json폴더에 종속성으로 자동으로 추가해줍니다. 설치 하지 않아도 상관 없지만 설치하면 편하고 유용하기 때문에 설치해줍니다.

 VSCode 설정
 vscode 확장 프로그램인 ZipFS 설치
필수는 아니지만 압축되어있는 패키지의 코드를 살펴보기 위해 해당 확장 프로그램이 필요합니다.
그리고 아래 명령어를 입력하여 sdk 를 설치해줍니다.
yarn dlx @yarnpkg/sdks vscode

jest-dom 설치
여기까지 진행하고 yarn start 를 하면 테스트 파일에서 에러가 나는데요. 이 경우 jest-dom을 재설치 해주면 해결됩니다. 
yarn remove @testing-library/jest-dom
yarn add -D @testing-library/jest-dom

gitignore 세팅
마지막으로는 .gitignore 파일 세팅이 남았는데요. 두 가지 선택지가 있습니다. 바로 zero install을 사용할 것이냐 사용하지 않을 것이냐 입니다. 제로 인스톨은 패키지 파일들을 모두 git에서 형상관리를 해서 jenkins 같은 툴을 이용하여 배포를 할 때 배포시간을 단축하는 방법입니다. 패키지 파일들이 모두 형상관리 되기 때문에 git clone을 한 시점에 의존성 패키지들이 모두 설치되고 배포시간이 극단적으로 단축됩니다. 아래와 같이 .gitignore 파일에 추가해주세요.
제로 인스톨 사용 시
.yarn/*
!.yarn/cache
!.yarn/patches
!.yarn/plugins
!.yarn/releases
!.yarn/sdks
!.yarn/versions
제로 인스톨 미사용 시
.pnp.*
.yarn/*
!.yarn/patches
!.yarn/plugins
!.yarn/releases
!.yarn/sdks
!.yarn/versions

마치며 (스크립트 공유)
프로젝트 세팅을 할 때 새로운 환경을 적용하게 되면 항상 삽질을 한 번씩은 하게 되는 것 같습니다. 저 같은 경우에는 한 번 했던 삽질을 하지 않기 위해 이런 기록도 기록이지만 세팅하는 과정을 쉘 스크립트로 작성해놓고 사용하는 것도 좋은 방법인 것 같습니다. 위 과정을 쉘 스크립트로 작성한 github 링크를 공유 드리니 해당 스크립트를 사용하시는 것도 좋을 것 같습니다.

 

GitHub 링크
https://github.com/yeo311/create-react-app-with-yarn-berry 

 
GitHub - yeo311/create-react-app-with-yarn-berry: create react app with yarn berry. (with typescript)

create react app with yarn berry. (with typescript) - GitHub - yeo311/create-react-app-with-yarn-berry: create react app with yarn berry. (with typescript)

github.com
https://github.com/yeo311/create-react-app-with-yarn-berry/blob/main/create-react-app-with-yarn-berry.sh

 
GitHub - yeo311/create-react-app-with-yarn-berry: create react app with yarn berry. (with typescript)

create react app with yarn berry. (with typescript) - GitHub - yeo311/create-react-app-with-yarn-berry: create react app with yarn berry. (with typescript)

github.com
 

참조 문서
https://toss.tech/article/node-modules-and-yarn-berry

https://haranglog.tistory.com/28