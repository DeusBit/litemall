# litemall

Another small mall system.

litemall = Spring Boot backend + Vue administrator front end + WeChat applet user front end + Vue user mobile end

* [Documentation](https://linlinjava.gitbook.io/litemall)
* [Contribution](https://linlinjava.gitbook.io/litemall/contribute)
* [FAQ](https://linlinjava.gitbook.io/litemall/faq)
* [API](https://linlinjava.gitbook.io/litemall/api)

## Project Examples

### Small mall example

* renard-wx module example

![](./doc/pics/readme/renard_wx_demo.png)

> Note: This example is a real small mall where developers can purchase goods and pay, but please do not try to refund.

* litemall-wx module example

![](./doc/pics/readme/litemall_wx_demo.png)

> Note: This example is a test mall. Developers should not try to purchase products, pay, and refund operations.

### Light mall example

Please scan the following QR code to access:

![](./doc/pics/readme/mobmall.png)

Or the browser uses mobile mode to access the following URL: [http://122.51.199.160:8080/vue/index.html#/](http://122.51.199.160:8080/vue/index.html#/)

note:
> 1. Due to the large amount of data loaded for the first time, it is recommended to access the wifi network and wait patiently for a few seconds.
> 2. This example is a test light mall, does not support payment, and is under development incomplete.

### Management background instance

! [] (./ doc / pics / readme / admin-dashboard.png)

1. Open your browser and enter the following URL: [http://122.51.199.160:8080/#/login](http://122.51.199.160:8080/#/login)
2. Administrator username `admin123`, administrator password` admin123`
> Note: This example is only the test management background, not the management background of the first two small malls.

## Item code

* [Code Cloud](https://gitee.com/linlinjava/litemall)
* [GitHub](https://github.com/linlinjava/litemall)

## Project Architecture
![](./doc/pics/readme/project-structure.png)

## Technology stack

> 1. Spring Boot
> 2. Vue
> 3. WeChat Mini Program

![](doc/pics/readme/technology-stack.png)

## Features

### Small mall features

* Home
* Topic list, topic details
* Category list, category details
* Brand list, brand details
* New product launch, popular recommendation
* Coupon list, coupon selection
* Group buy
* search for
* Product details, product reviews, product sharing
* shopping cart
* Order
* Order list, order details, order after sales
* Address, collection, footprint, feedback
* Customer Service
### Management platform features

* Member Management
* Store Management
* Product management
* Promotion Management
* System Management
* Configuration management
* Statistical report

## 快速启动

1. Configure the minimum development environment:
    * [MySQL](https://dev.mysql.com/downloads/mysql/)
    * [JDK1.8 or above](http://www.oracle.com/technetwork/java/javase/overview/index.html)
    * [Maven](https://maven.apache.org/download.cgi)
    * [Nodejs](https://nodejs.org/en/download/)
    * [WeChat developer tools](https://developers.weixin.qq.com/miniprogram/dev/devtools/download.html)
    
2.The database is sequentially imported into the database file under litemall-db / sql
    * litemall_schema.sql
    * litemall_table.sql
    * litemall_data.sql

3. Start the back-end services of the small mall and the management backend

     Open the command line and enter the following command
    ```bash
    cd litemall
    mvn install
    mvn clean package
    java -Dfile.encoding=UTF-8 -jar litemall-all/target/litemall-all-0.1.0-exec.jar
    ```
    
4. Start management background front end
   
    Open the command line and enter the following command
    ```bash
    npm install -g cnpm --registry=https://registry.npm.taobao.org
    cd litemall/litemall-admin
    cnpm install
    cnpm run dev
    ```
    At this point, the browser opens, enter the URL `http: // localhost: 9527`, and enter the management background login page.
    
5. Launch the small mall front end
      
   There are two sets of small mall front ends litemall-wx and renard-wx, which developers can import and test separately:
   
    1. WeChat development tools import litemall-wx project;
    2. Project configuration, enable "Do not verify legal domain name, web-view (business domain name), TLS version, and HTTPS certificate"
    3. Click "Compile" to preview the effect in WeChat development tools;
    4. You can also click "Preview", and then the phone scans to log in (but the phone needs to enable the debugging function).
      
    note:
    > Here is the simplest way to start, and the WeChat login, WeChat payment and other functions of small malls require developer settings to run
    > For more details, please refer to [Document](https://linlinjava.gitbook.io/litemall/project).

6. Launch the light mall front end

     Open the command line and enter the following command
    ```bash
    npm install -g cnpm --registry=https://registry.npm.taobao.org
    cd litemall/litemall-vue
    cnpm install
    cnpm run dev
    ```
    At this time, the browser (recommended to use chrome mobile mode) is opened, enter the URL `http: // localhost: 6255`, and then enter the light mall.

     note:
     > The function is very unstable now and is in the development stage.
        
## Development Plan

Current version [v1.7.0](https://linlinjava.gitbook.io/litemall/changelog)

There are many deficiencies in the current project development. The following is the current development plan.

V 1.0.0 accomplishes the following goals:

1. Except for some functions (such as coupons), the optimization and improvement of the small mall has basically ended;
2. The management background basically implements CRUD operations on all tables;
3. The back-end service can check the parameters.

V 2.0.0 accomplishes the following goals:

1. Small mall and management back office complete all basic business;
2. The management background implements statistical functions, log functions, and permissions functions;
3. Business code and detail code are adjusted and optimized;
4. Development of light mall;

V 3.0.0 accomplishes the following goals:

1. Manage some auxiliary functions in the background
2. Back-end services strengthen security functions and configuration functions
3. Cache function and optimize some performance

## caveat

> 1. This project is only for learning exercises
> 2. The project is not perfect, it is still under development, and will not bear any consequences
> 3. The code of this project is open source [MIT](./LICENSE), and the project document adopts [Attribution-Prohibited Deduction 4.0 International Agreement License](https://creativecommons.org/licenses/by-nd/4.0/deed.zh)

## Thanks

This project is based on or refers to the following:

1. [nideshop-mini-program](https://github.com/tumobi/nideshop-mini-program)

   Project introduction: Open source WeChat Mini Program Mall (WeChat Mini Program) based on Node.js + MySQL

   Project reference:
   
   1. litemall project database is based on the nideshop-mini-program project database;
   2. The litemall-wx module of the litemall project is developed based on nideshop-mini-program.

2. [vue-element-admin](https://github.com/PanJiaChen/vue-element-admin)
  
   Project introduction: A background integration solution based on Vue and Element
  
   Project reference: The front-end framework of the litemall-admin module of the litemall project is modified and extended based on the vue-element-admin project.

3. [mall-admin-web](https://github.com/macrozheng/mall-admin-web)

   Project introduction: mall-admin-web is a front-end project of e-commerce back-end management system, which is implemented based on Vue + Element.

   Project reference: Some page layout styles of the litemall-admin module of the litemall project refer to the mall-admin-web project.

4. [biu](https://github.com/CaiBaoHong/biu)

   Project introduction: Management background project development scaffolding, based on vue-element-admin and springboot construction, front-end and back-end separation development and deployment.

   Project reference: The permission management function of the litemall project refers to the biu project.

5. [vant--mobile-mall](https://github.com/qianzhaoy/vant--mobile-mall)

   Project description: Mobile mall based on the vant component library.

   Project reference: The litemall-vue module of the litemall project is developed based on the vant--mobile-mall project.

## Recommended

1. [Flutter_Mall](https://github.com/youxinLu/mall)
   
   Project description: Flutter_Mall is a Flutter open source online mall application.
   
2. [Taro_Mall](https://github.com/jiechud/taro-mall)

    Project introduction: Taro_Mall is a multi-end open source online mall application. The background is developed based on litemall, and the front end is written in Taro framework.
## Question

![](doc/pics/readme/qq3.png)

* Developers have questions or good suggestions can use Issues feedback exchange, please give details
  * Development, business and cooperation issues should be discussed in the development exchange group
  * If you really need to ask questions in the QQ group, please complete the following process before asking questions:
     * Please read this project documentation carefully, especially [**FAQ**](https://linlinjava.gitbook.io/litemall/faq), to see if it can be resolved;
     * [Please read the wisdom of asking questions](https://github.com/ryanhanwu/How-To-Ask-Questions-The-Smart-Way/blob/master/README-zh_CN.md);
     * Please Baidu or Google related technology;
     * Please check the official documentation of related technologies, such as the official documentation of WeChat Mini Program;
     * Please do as much DEBUG or thinking analysis as possible before asking questions, and then give detailed error related information and personal understanding of the question when asking questions.
## License

[MIT](https://github.com/linlinjava/litemall/blob/master/LICENSE)
Copyright (c) 2018-present linlinjava