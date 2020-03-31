# Contribution guide

Contributions of any kind are welcome, including:

* Bugs reported in Issue
* Discussion of business or technology in Issue
* Pull Request
* Comments or additions to the documentation
* Any other actions that make sense for this project

Personal ability is limited, welcome to develop together.

At present, the basic framework of the project has been established, but it is not complete, so people are welcome to discuss technology and business together.
But before the exchange and cooperation, please check the following ideas.

## Project Idea

litemall's design audience is small and micro enterprises, not Internet companies, so the development concept of litemall is a small and beautiful:

* Small, refers to simple technology, simple architecture, low performance indicators, and business covering only basic functions
* United States refers to new technology, clear and easy-to-expand architecture, low security factor, and services that can be directly deployed and used

Because of the above considerations, the current LiteMall architecture is simple, and the three technology stacks are the most basic.

That being said, the barriers to entry for development are actually not low:
* The project uses three technology stacks, which are relatively independent of each other;
* The adopted spring boot framework and vue-element-admin framework already rely on quite a few libraries;
* In addition to development technologies, other technologies are also involved in the development process, including environment configuration, version control,
  Test technology, logging, deployment, and more.

So before contributing new code or discussing business, it is recommended to consider the following issues:

* Did you introduce too much complexity without corresponding benefits?

  Because this project hopes to be used by more people, the complexity of the project is an issue to be considered.
  If the complexity and benefits are the same, then the possibility of receiving contributions is actually worth discussing.

* Are you relying on too many libraries? Do I have to rely on this library? If it's just a tiny part of the library, is it possible to implement a simple util class yourself?

  For example, some technical frameworks use fastjson, but in fact spring boot already uses jackson by default, so if there is no special reason,
  Contributors should use Jackson whenever possible.
  
* Are you blindly using too much advanced technology? Can I suspend adoption?

  Be cautious here. For example, if you want to introduce caching technology, you need to learn about caching-related libraries, and you may encounter some problems in use.
  Prior to v2.0.0, there was no need to consider performance issues in advance. Similarly, single sign-on technology is a basic function that must exist in a distributed architecture, but
  At present, the two back-end services can use their own login schemes.

  note:
  > This is not a rejection of new technology, but rather a gradual, cautious approach.
  > In addition, for the application of new technologies, the plan is to develop an independent distributed version based on the stable version of the project.
  
* Already have a technology, is it necessary to contribute another technology for the same purpose?

  Here is welcome. For example, there is already a management background for the vue framework, but the management background of other front-end frameworks is also welcome.
  This can be chosen by users with different technical backgrounds. Of course, you should try to maintain synchronization between different versions. Or, applet
  There are already some development frameworks, and the small terminal in the small mall is still the original applet technology, so based on these new development frameworks
  Refactoring the applet is welcome.
  
  In other words, this project hopes to avoid technical depth, but prefers technical breadth to help yourself and more people learn about different technologies.
  
* Contribute less code or improve documentation.

  Here is welcome. Many open source projects have suggested that contributions should be small and logical. This makes it clear when reviewing the code.
  Of course, if the word is not spelled correctly, you should fix the same problem in one commit whenever possible.
  
Although a cautious attitude towards new technologies may be shown here, if users find better technologies or are necessary, welcome discussion.
Of course, if developers do not agree with some of the ideas here, they can also develop their own versions based on their own technical selection.
If you think your development is good, you can submit a link address in this project to let other developers know.

## Project business

The basic business functions envisaged for this project have been enumerated in the documentation.

If you want to introduce advanced functions, such as distribution functions, it is recommended that users develop their own on the basis of this project.

If you think that the basic business has not been realized, you can discuss it with Issue or QQ group and join the subsequent development plan.

Of course, it is more desirable for developers to directly provide code to enrich and improve the current basic business functions.

## Code contribution

* Code specifications are currently not strictly required and will be added later.

## IssueSpecifications

* Before submitting an issue, please search for related issues.
* Please submit as much information as possible
* Suggest Issue is based on the latest code