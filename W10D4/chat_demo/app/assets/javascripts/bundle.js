/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/app.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/ChatMachine.js":
/*!*********************************!*\
  !*** ./frontend/ChatMachine.js ***!
  \*********************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("var ChatMachine = function($el){\n  this.$messages = $el.find(\"ul\");\n  this.$form = $el.find(\"form\");\n  this.$form.on(\"submit\", this.submitMessage.bind(this));\n};\n\n//an event handler for \"this.$form.on(\"submit\")\nChatMachine.prototype.submitMessage = function(e){\n  e.preventDefault();\n  $.ajax({\n    method: \"POST\",\n    url: \"./messages.json\",\n    datatype: \"json\",\n    data: this.$form.serialize(),\n    success: function(message){\n      this.addMessage(message);\n      this.clearForm();\n    }.bind(this)\n  });\n};\n\nChatMachine.prototype.addMessage = function (message){\n      const $message = $(\"<li>\").text(message.author + \": \" + message.text);\n      this.$messages.append($message);\n};\n\nChatMachine.prototype.clearForm = function(){\n  this.$form.find(\"input[type='text']\").val(\"\");\n}\n\nmodule.exports = ChatMachine;\n\n\n//# sourceURL=webpack:///./frontend/ChatMachine.js?");

/***/ }),

/***/ "./frontend/app.js":
/*!*************************!*\
  !*** ./frontend/app.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("//js goes here :)\nvar ChatMachine = __webpack_require__(/*! ./ChatMachine.js */ \"./frontend/ChatMachine.js\");\n\n$(function(){\n  new ChatMachine($('.chat'));\n});\n\n\n//# sourceURL=webpack:///./frontend/app.js?");

/***/ })

/******/ });