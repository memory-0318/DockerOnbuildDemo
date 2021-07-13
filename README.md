# Docker `ONBUILD`範例

## 說明
* 使用Docker `ONBUILD`定義Image的建置流程，本範例區分為兩個Dockerfile (放置在`/docker`目錄)，分別為：
    * `./docker/maven.onbuild.Dockerfile` - 使用`ONBUILD`定義maven建置流程，`ONBUILD`內的指令不會在Image建置時執行，只有繼承的子
      Image在建置時才會執行。
    * `./docker/Dockerfile` - 使用`./docker/maven.onbuild.Dockerfile`執行maven建置，並將maven產生的jar檔複製到要部署的Image中。

## 建置流程
* 開啟cmd工具，將專案目錄 (`/DockerOnbuildDemo`)設為工作目錄
* 建置maven流程Image，並設上tag: `maven-base`，供等等應用程式的Image建置使用：
  ```shell
  docker build --file ./docker/maven.onbuild.Dockerfile -t maven-base .
  ```
* 建置應用程式的Image：
  ```shell
  docker build --file ./Docker/Dockerfile -t app .
  ```
* 建置完畢後，使用前述步驟產生的Image，建立Container：
  ```shell
  docker run -p 8080:8080 app
  ```
* 若有成功執行，可在瀏覽器輸入`http://localhost:8080/actuactor/health` 取得系統狀態。