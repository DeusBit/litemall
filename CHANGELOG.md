# Update log

## V 1.7.0
 
* 2020-02-15 * Supports docker deployment, after-sales management, notification management, and database backup for seven days.

#### Bug fixes

  * `Small mall` back-end interface part has horizontal unauthorized loopholes
  * `Small Mall` verification code will still send verification code before timeout
  * `Small Mall` shows administrator comment reply (# 340 by sunyinggang)
  * `Management background` Administrator comment reply (# 340 by sunyinggang)
  * `Light Mall` returns incorrect shipping address (# 320 by kevinleeex)

#### Optimization
 
  * `Management background` topic supports sorting and batch deletion
  * `Base system` database with four table indexes (# 328 # 330 # 332 # 334 by wtune)
  
#### New Features
  
  * `Base system` supports docker deployment (reference implementation # 321 by yuana1)
  * `Base System` automatically backs up 7 days of data to the backup folder
  * `Management background` Notification Center and Notification Management
  * `Management background` login page adds copyright content
  * `Management background` After-sales management
  * `Small Mall` order after-sale list, after-sale details, after-sale application
  * `Light Mall` for account registration (# 324 by yelongbao)

## V 1.6.1
 
* 2020-01-01 *

#### Bug fixes

  * `Base system` deletes unnecessary bean annotations, resulting in unnecessary instantiation.
  
## V 1.6.0
 
* 2019-12-31 *, optimize group purchase realization, delete WeChat template realization.

#### Bug fixes

  * `Management background` Fix image overflow when viewing product details (# 305 by zaoangod)

#### Optimization
 
  * `Small mall` restructuring group purchase implementation
  * `Small Mall` delete WeChat template implementation
  * `Management background` optimize query area speed (# by)
  * `Management background` updated vue-element-admin framework version 4.2.1

#### New Features
  
  * `Small Mall` Replace vant icon as much as possible
  * `Small Mall` Home Banner Add Product Jump (# 299 by staneychan)
  * `小 商城` uses ssl to send email notifications (# 307 by jessonxiang)
   
## V 1.5.0
 
* 2019-11-15 *, continue to optimize the light mall module, and the recommended project Flutter_Mall

#### Bug fixes

  * `小 商城` coupon binding binding coupon ID (# 157 by @ beaver383)
  * `Small Mall` comment list does not display correctly
  * `Light Mall` revised cancel order interface (# 256 by @ 1037621594)
  
#### Optimization
 
  * `Small Mall` uses delay queue to realize payment overtime cancellation function (refer to # 275 by @ alexzhu0592)
  * `Small mall` share button optional configuration (# 239 by @galenzhao)

#### New Features
  
  * `Basic System` supports Alibaba Cloud SMS
  * `Light Mall` access to WeChat payment H5 payment (# 291 by @ beaver383)
  * `Small Mall` group purchase group canceled overdue (# 284 by @ beaver383)
  * Add print of `Management background` order details (# 274 by @fanchenggang)
  * README document recommendation item Flutter_Mall
  
## V 1.4.0
 
* 2019-05-16 *, support mobile terminal light mall

#### Bug fixes

  * `Small mall shopping cart and order quantity must be a positive integer
  * `Small Mall` WeChat payment callback verification failure notification message
  * `Small Mall` receiving address is combined with userId and id
  * `Management background` Administrators cannot delete their accounts

#### Optimization
 
  * `Document` supports API documentation
  * `Base System` updated third-party plugin mybatis-generator-plugin to 1.3.2
  * `Management background` does not allow the administrator to modify the administrator password through the editing interface

#### New Features
  
  * `Small Mall` help center page
  * `Small Mall` backend login verification method uses JWT (# 167 by @ Bigger-Ma)
  * `Light mall` basic structure completed (# 157 by @pkwenda)
  * `Management background` supports operation log management
  
## V 1.3.0
 
* 2019-03-11 *, support configuration management

  * `Management background` product category page and administrative area page are displayed in a tree structure;
  * `Management background` cancel internationalization and theme;
  * `Management background` supports configuration management;
  
  Note: Although it is possible to set the order timeout time in the configuration management, due to the current timed query method, there will be a delay.
  So the final order timeout period needs to add these delays to update the status. This will be resolved later (for example using redis).

## V 1.2.0
 
* 2019-03-03 *, support rights management

  * `Management background` supports permission management;
  * `Small Mall` cancels programmatic transaction management and uses annotation transaction management;
  * `Small Mall` uses multiple threads for database query operations;

## V 1.1.0
 
* 2018-12-23 *, support coupons

  * `Management background` supports coupon management;
  * `Management background` Adjust timing tasks to job subpackages for further migration to independent modules in the future;
  * `Small Mall` supports coupon list display and personal coupon functions;
  * `Base system` Express Bird API adjustment

## V 1.0.0
 
* 2018-12-03 *, complete documentation

## V 1.0.0.rc1
 
* 2018-11-30 *, access WeChat refund API

  * `Management background` access to WeChat refund API;
  * `Management background` error code cancel magic number;
  * `Management background` prohibits super administrators from changing passwords;
  
## V 1.0.0.rc0
 
* 2018-11-23 *, clean code, update management front-end framework

  * `Management background` is updated to 3.9.3 based on vue-element-admin;
  * `Management background` The increase of goods inventory and the reduction of the use of custom Mappers;
  * `Management background` supports product reply;
  * `Small Mall` supports product reply;
  
## V 0.10.2
 
* 2018-11-08 *, fix some minor bugs

  * `Management background` Rich text editing adjustment, fix the problem of incorrect text alignment on the applet;
  * `Small Mall` supports group purchase area list page
  * `Small Mall` turns off the default built-in cache function
 
## V 0.10.1
 
* 2018-11-07 *, fix some minor bugs
  
## V 0.10.0
 
* 2018-10-26 *, fix many small bugs

  * `Management background` verify POST parameters
  * `Management background` optimistic lock cancellation, only for order table
  
## V 0.9.0
 
* 2018-09-14 *, support group purchase, the second set of small mall renard-wx

  * `Small mall` supports group purchase
  * `Small mall` open source second set of small mall renard-wx
  * `Small mall` support feedback component
  * `Management background` updates with optimistic locks
  * `Management background` Upgrade Spring Boot to 2.x

## V 0.8.0
 
* 2018-07-30 *, remove os module, perfect applet
 
  * `Small mall` supports product sharing
  * `Small mall` logistics display
  * `Small mall` optimizes product purchase styles, thanks [usgeek] (https://github.com/linlinjava/litemall/pull/31)
  * `Small mall` supports customer service, about page, mobile phone binding, thanks [usgeek] (https://github.com/linlinjava/litemall/pull/31)
  * `Small Mall` supports SMS verification codes for account registration and password retrieval
  * `Management background` page query is sorted by creation time by default
  * `Base system` supports logistics tracking
  * `Basic System` supports Alibaba Cloud Storage, thanks [usgeek] (https://github.com/linlinjava/litemall/pull/31)
  * `Project` delete os module, related functions are migrated to wx-api module and admin-api module
  * `Project` adjusted from the default stand-alone multi-service plan to the default stand-alone single-service plan
  * `Project` temporarily cancels docker support and .gitlab-ci.yml support
  * `Item` database adds litemall_system table to store system configuration information
  * `Project` cancel swagger support

## V 0.7.0
 
* 2018-07-16 *, the database is simplified again, and it supports SMS reminder, email reminder, and Tencent object storage service
 
  * `Management background` page query is sorted by creation time by default
  * `Manage background` multiple pages to improve page effects
  * `Management background` supports product listing and product editing
  * `Basic System` supports Tencent Cloud SMS reminder and email reminder, thanks [Menethil] (https://github.com/linlinjava/litemall/pull/23)
  * `Base System` supports Tencent Object Storage, thanks [Menethil] (https://github.com/linlinjava/litemall/pull/24)
  * The `Project` database is simplified again, and the small mall and management background code are adjusted accordingly.

## V 0.6.0
 
* 2018-06-30 *, the project supports product listing and statistics functions
 
  * `Small mall` adjusted due to wx.getUserInfo interface, WeChat login adjustment
  * `Small mall` supports mobile number verification
  * `Management background` supports simple statistics
  * `Management background` supports product listing
  * `Management background` for rich text editing based on official tinymce-vue
  * `Project` supports docker deployment
    
## V 0.5.0
 
* 2018-05-11 *, the project supports WeChat payment and fixes some bugs in the applet
 
  * `Small mall` adjusted due to wx.getUserInfo interface, WeChat login adjustment
  * `Small mall` Repair all items will be placed in the shopping cart immediately
  * `Small mall` fixed adding delivery address successfully when ordering goods but no display
  * `Small mall` fixed the address information of adding delivery address when ordering goods could not be scrolled
  * `Small mall` Repair shopping cart items cannot be deleted
  * `Small mall` supports WeChat payment
  * `Management background` supports WeChat payment
  * The `base system` database litemall_collect id is set to increase automatically
  * `Base system` database deletes four temporary tables related to the region
  * `Basic system` litemall-core module swagger2 configuration, support swagger documentation
  * `Project` multi-module maven structure redesign
  * `Project` document arrangement deployment plan and online plan
  * `Project` documentation supports changelogs, contribution guides, and frequently asked questions

## V 0.4.0
 
* 2018-04-21 *, adjustment of project structure, adding two modules
 
  * Annotate the backend service code of `Small Mall` and verify the input parameters
  * `Small shopping malls' will display" Sold out "when the product is out of stock
  * `Management background` supports multiple logins of the same account by the administrator for easy demonstration
  * `Management background` thematic content supports rich text editing
  * `Base system` litemall-os-api link adjusted from` storage / index / index` to `os / index / index`
  * `Base system` litemall-os-api supports browser display.
  * `Basic System` added litemall-core module, integrated litemall-os-api, litemall-wx-api
     And litemall-admin-api common code
  * `Basic System` added litemall-all module as a package module, supporting three backend services and static files
     Packaged into a war project package
     
## V 0.3.0

* 2018-04-07 *, business module adjusted from physical deletion to logical deletion

* `Small mall` backend service encrypted user account password
* `Small mall` If the user selects the product, the price corresponding to the product is displayed; otherwise, the product price is displayed
* `Small mall` Only if the specifications are selected, the product page will display the specifications text of the corresponding product
* `Management background` product details support t