/**
 * Populate DB with sample data on server start
 * to disable, edit config/environment/index.js, and set `seedDB: false`
 */

'use strict';

var User = require('../api/user/user.model');

User.find({}).remove(function() {
  User.create({
    provider: 'local',
    name: 'Test User',
    email: 'test@test.com',
    password: 'test'
  }, {
    provider: 'local',
    role: 'admin',
    name: 'Darryl',
    email: 'dazsnow@gmail.com',
    password: 'mugwuffin'
  }, function() {
      console.log('finished populating users');
    }
  );
});

var Skills = require('../api/skills/skills.model');

Skills.find({}).remove(function() {
  Skills.create({
    name: "Consultancy",
    description: "<p>I can help you critique an existing website and offer suggestions for features and improvements that may boost your return on investment. I can also work with your product team to improve workflow processes, review code and designs, and help create a rhobust and maintainable code base. This will ensure that your team works more efficiently and your product is less prone to errors or disruptions.</p>"
  }, {
    name: "Design",
    description: "<p>Design starts with planning content and user actions. Using this information, the next step is generating wireframe models of the website or application. A style guide will demonstrate the look and feel of each component, and then an interactive design can be built in the browser for you to experiment with.</p>"
  }, {
    name: "Front-End Development",
    description: "<p>Front-End development is the interactive part of the website or app - it's what people see and use. It generally means coding in HTML, CSS, and JavaScript.</p><p>I like to use some of the many open-source tools and frameworks available for free online to make this part of the development fast and reliable.</p>"
  }, {
    name: "Back-End Development",
    description: "<p>This is the part that the users don't see. It's all about extracting data from somewhere and providing it to the front-end of the website or application. I use languages like JavaScript, PHP, and Ruby, and database systems like MySQL, MongoDB, and Redis.</p>"
  }, {
    name: "Wordpress",
    description: "<p>Wordpress is an open-source Content Management System (CMS) that powers about <strong>60%</strong> of all websites! The advantage of a CMS is that you will be able to log in and change/add content to your website without having to ask an expert like me every time.</p><p>Using Wordpress, I can create for you a custom website - anything from a blog to an e-commerce platform - that you will be in complete control of.</p>"
  }, {
    name: "NodeJS",
    description: "<p>NodeJS apps are great because they're built with JavaScript, which most web developers are familiar with, fast to build, and are well-suited to real-time apps or apps which serve lots of small bits of data.</p><p>I have been working on NodeJS applications for nearly 2 years. I've read all the books, followed all the tutorials, and had a lot of fun. When building Node apps I like to use the Express framework, but I'm getting excited about Koa.</p>"
  }, {
    name: "AngularJS",
    description: "<p>This very website is built using AngularJS - a front-end framework from Google. It's great for building rhobust and scalable data-driven web apps quickly.</p><p>I've been building AngularJS apps for more than 2 years, often in conjunction with a NodeJS back-end.</p>"
  }, {
    name: "Responsive Design",
    description: "<p>This isn't just building websites for mobile/tablet/desktop. It's a way of building websites and apps that are <strong>device agnostic</strong>. Every project I work on is responsive by default, unless there's a very good reason why it shouldn't be. That means I always start building for the smallest, most basic devices, and use various methods to detect features and capabilities that can afford for more content or functionality to be loaded.</p><p>Responsive design requires a significant change to the web design processes, which many agencies struggle with - I can help with that too!</p>"
  }, {
    name: "Testing",
    description: "<p>Testing covers browser compatibility, performance, accessibility, SEO, and general usability.</p>"
  }, {
    name: "Project Management",
    description: "<p>Already have designers and developers? I can take over the project management - requirements gathering, documentation, updating stakeholders, planning timelines, testing and development procedures, and ultimate delivery.</p>"
  }, {
    name: "Dev Ops",
    description: "<p>I can help your team set up testing, staging, and production environments, version control systems, and continuous integration workflows.</p>"
  }, function() {
      console.log('finished populating skills');
    }
  );
});