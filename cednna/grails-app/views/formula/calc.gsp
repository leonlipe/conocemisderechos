<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>

<title>Calculator</title>
<style>
body { 
	font-family: Tahoma, Geneva, sans-serif;
	margin: 0; 
	padding: 0; 
	background-color: #000; 
}
#resultInput { 
	display: block;
	width: 99%;
	height: 12%;
	margin: 0 auto;  
	padding: 0;
	font-size: 100%; 
	background-color: #ccc; 
	border: none; 
	text-align: right; 

	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;	
	
	box-shadow:inset 0 0 5px #000000;	
	-moz-box-shadow:inset 0 0 5px #000000;
	-webkit-box-shadow:inset 0 0 5px #000000;
}
#basic { 
	margin: 0 auto; 
	padding: 0;
	border-collapse: collapse;
	height: 85%;
}
#basic td {
	background-color: #000;
	border: 10px solid #000;
	padding: 0;
	width: 18%;
	height: 18%;
}
#basic button {
	display: block;
	font-size: 100%;
	width: 100%;
	height: 100%;	
	padding: 0;
	text-align: center;
	vertical-align: middle;
	line-height: 100%;
	color: #eee;
	border: none;
	background-color: #333;
	background: -webkit-gradient(
		linear,
		left bottom,
		left top,
		color-stop(0.50, rgb(5,5,5)),
		color-stop(0.50, rgb(71,71,71))
	);
	background: -moz-linear-gradient(
		center bottom,
		rgb(5,5,5) 50%,
		rgb(71,71,71) 50%
	);	
	border: 1px solid #666;

	border-radius: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
}
#basic button:hover {
	color: #fff;
	cursor: pointer;
	border: 1px solid #fff;
}
#basic button:active {
	background: none;
	background-color: #ccc;
	color: #000;
}
#credits {
	display: block;
	color: #999;
	margin: 0;
	text-align: right;
	padding: 1px 5px 0 0;
	height: 3%;
}
#credits a, #credits a:link, #credits a:visited {
	color: #ccc;
}
#credits a:hover { 
	color: #000; 
	background-color: #ccc;
}
</style>
</head>
<body onload="Calc.init()" onresize="Calc.redraw()">
<div id="container">
<input id="resultInput" type="text" value="" />
<table id="basic" cellpadding="0" cellspacing="0">	
	<tr>
		<td><button data-keypress="47" data-char="&#247;" onmousedown="Calc.append(this); return false;">&#247;</button></td>
		<td><button data-keypress="42" data-char="&#215;" onmousedown="Calc.append(this); return false;">&#215;</button></td>
		<td><button data-keypress="45" data-char="&#45;" onmousedown="Calc.append(this); return false;">&#151;</button></td>
		<td><button data-keypress="43" data-char="&#43;" onmousedown="Calc.append(this); return false;">&#43;</button></td>
	</tr>
	<tr>
		<td><button data-keypress="55" data-char="7" onmousedown="Calc.append(this); return false;">7</button></td>
		<td><button data-keypress="56" data-char="8" onmousedown="Calc.append(this); return false;">8</button></td>
		<td><button data-keypress="57" data-char="9" onmousedown="Calc.append(this); return false;">9</button></td>
		<td><button data-keydown="8" onmousedown="Calc.backspace(); return false;">&laquo;</button></td>
	</tr>
	<tr>
		<td><button data-keypress="52" data-char="4" onmousedown="Calc.append(this); return false;">4</button></td>
		<td><button data-keypress="53" data-char="5" onmousedown="Calc.append(this); return false;">5</button></td>
		<td><button data-keypress="54" data-char="6" onmousedown="Calc.append(this); return false;">6</button></td>
		<td><button data-keydown="46" onmousedown="Calc.clear(); return false;">C</button></td>
	</tr>
	<tr>
		<td><button data-keypress="49" data-char="1" onmousedown="Calc.append(this); return false;">1</button></td>
		<td><button data-keypress="50" data-char="2" onmousedown="Calc.append(this); return false;">2</button></td>
		<td><button data-keypress="51" data-char="3" onmousedown="Calc.append(this); return false;">3</button></td>
		<td rowspan="2"><button data-keydown="13" onmousedown="Calc.equals(); return false;">=</button></td>
	</tr>
	<tr>
		<td><button data-keypress="46" data-char="." onmousedown="Calc.append(this); return false;">.</button></td>
		<td colspan="2"><button data-keypress="48" data-char="0" onmousedown="Calc.append(this); return false;">0</button></td>
	</tr>
</table>
</div>
<script type="text/javascript" language="javascript">
var Calc = (function() {
	var DIVIDE = 247;
	var MULTIPLY = 215;
	var SUBTRACT = 45;
	var ADD = 43;

	var MIN_RESULT_FONT_SIZE = 16;
	var MAX_CHARS_SHOWABLE_IN_RESULT_INPUT = 1000;

	var resultInput = null;
	var basicTable = null;
	var credits = null;
	var container = null;
	var viewportWidth = null;
	var viewportHeight = null;

	var calcStr = "";

	return new function() {
		var _self = this;

		this.insert_at_cursor = function(_inputField, _str) {
			// TODO: this doesn't yet work correctly in all browsers.
			_inputField.focus();
			// IE support
			if (document.selection) {
				sel = document.selection.createRange();
				sel.text = _str;
			}
			// MOZILLA/NETSCAPE support
			else if (_inputField.selectionStart || _inputField.selectionStart == '0') {
				var startPos = _inputField.selectionStart;
				var endPos = _inputField.selectionEnd;
				_inputField.value = _inputField.value.substring(0, startPos) + _str + _inputField.value.substring(endPos, _inputField.value.length);
			} else {
				_inputField.value += _str;
			}
		}

		this.input_keypress_handler = function(e) {
			var buttons = document.getElementsByTagName("button");
			for (var i=0; i<buttons.length; ++i) {
				if (buttons[i].hasAttribute("data-keypress") && e.charCode == parseInt(buttons[i].getAttribute("data-keypress"))) {
					_self.insert_at_cursor(resultInput, buttons[i].getAttribute("data-char"));
					break;
				}
			}
			// only allow backspace (8) and del (46) from this point onwards
			if (8 != e.keyCode && 46 != e.keyCode) {
				e.preventDefault();
				e.stopPropagation();
			}
			calcStr = resultInput.value; 
		}

		this.begin_direct_edit = function() {
			resultInput.value = calcStr;
			return false;
		}

		this.end_direct_edit = function() {
			_self.update_result_display();
			return false;
		}

		this.init = function() {
			resultInput = document.getElementById("resultInput");
			resultInput.onfocus = _self.begin_direct_edit;
			resultInput.onblur = _self.end_direct_edit;
			resultInput.onkeypress = _self.input_keypress_handler;

			basicTable = document.getElementById("basic");
			credits = document.getElementById("credits");
			container = document.getElementById("container");
			_self.redraw();
		}
		this.redraw = function() {
			// viewport: http://javascript.about.com/od/browserobjectmodel/a/bom10.htm, http://www.quirksmode.org/dom/w3c_cssom.html#windowview
			viewportWidth = parseInt(window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth);
			viewportHeight = parseInt((window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight) * 0.98);
			container.style.width = viewportWidth + "px";
			container.style.height = viewportHeight + "px";
			// font size
			var fontSize = parseInt(resultInput.offsetHeight * 0.9);
			if (MIN_RESULT_FONT_SIZE > fontSize) fontSize = MIN_RESULT_FONT_SIZE;
			document.body.style.fontSize = fontSize + "px";
			MAX_CHARS_SHOWABLE_IN_RESULT_INPUT = parseInt(1.7 * resultInput.offsetWidth / fontSize) - 1;
			// table width 
			basicTable.style.width = (viewportWidth < basicTable.offsetHeight ? parseInt(viewportWidth * 0.99): basicTable.offsetHeight) + "px";
			// credits
			credits.style.fontSize = (credits.offsetHeight - 2) + "px";
		}
		this.update_result_display = function() {
			if (calcStr.length >= MAX_CHARS_SHOWABLE_IN_RESULT_INPUT)
				resultInput.value = calcStr.substr(calcStr.length-MAX_CHARS_SHOWABLE_IN_RESULT_INPUT);
			else
				resultInput.value = calcStr;
		}
		this.append = function(_buttonElem) {
			calcStr += _buttonElem.getAttribute("data-char");
			_self.update_result_display();
		}
		this.clear = function() {
			calcStr = "";
			_self.update_result_display();
		}

		this.backspace = function() {
			if (1 <= calcStr.length)
				calcStr = calcStr.substr(0, calcStr.length-1);
			_self.update_result_display();
		}
		this.precedes = function(beforeOp, afterOp) { // BODMAS
			if (DIVIDE == afterOp && DIVIDE != beforeOp)
				return false;
			else if (MULTIPLY == afterOp && DIVIDE != beforeOp && MULTIPLY != beforeOp)
				return false;
			else
				return true;
		}
		this.equals = function() {
			_self.end_direct_edit(); // just in case

			// convert infix to postfix
			var opStack = new Array();
			var postfix = new Array();
			var infix = calcStr;

			// if starts with a minus then assume it's a negative number (probably result of a previous calculation)
			if (SUBTRACT == infix.charCodeAt(0))
				infix = "0" + infix;

			var currentNum = "";
			for (var i=0; i<infix.length; ++i) {
				var c = infix.charCodeAt(i);
				if (DIVIDE == c || MULTIPLY == c || SUBTRACT == c || ADD == c) {
					// add current number to output
					if (0 < currentNum.length) {
						postfix.push(currentNum);
						currentNum = "";
					}
					// pop off any operators with higher precedence than this one
					while (0 < opStack.length) {
						var top = opStack[opStack.length-1];
						if (!this.precedes(top, c))
							break;
						postfix.push(String.fromCharCode(opStack.pop()));
					}
					opStack.push(c);
				// check that it's a number or a decimal point
				} else if ( (48 <= c && 57 >= c) || 46 == c ) {
					var cStr = String.fromCharCode(c);
					// if it's a decimal point check that we haven't already encountered a decimal point
					if (46 == c && -1 != currentNum.indexOf(cStr)) {
						alert("Extra decimal point detected after '" + currentNum + "'");
						return;
					}
					currentNum += cStr;
				} else {
					alert("Invalid character: " + String.fromCharCode(c));
					return;
				}
			}
			// add remaining number to output
			if (0 < currentNum.length) {
				postfix.push(currentNum);
				currentNum = "";
			}
			// add remaining operators (LIFO)
			while (0 < opStack.length) {
				postfix.push(String.fromCharCode(opStack.pop()));
			}
			
			// start evaluating
			var evalStack = new Array();
			for (var i = 0; postfix.length > i; ++i) {
				var nextToken = postfix[i];
				var c = nextToken.charCodeAt(0);
				// if it's an op
				if (DIVIDE == c || MULTIPLY == c || SUBTRACT == c || ADD == c) {
					// need atleast two values on stack
					if (2 > evalStack.length) {
						alert("Not enough numbers entered for all operations!");
						return;
					} else {
						var arg2 = parseFloat(evalStack.pop());
						var arg1 = parseFloat(evalStack.pop());
						var ret = _self.eval2(c, arg1, arg2);
						if ('&infin;' == ret) {
							alert("Result is infinity!");
							return;
						}
						evalStack.push(ret);
					}
				// if it's a number
				} else {
					// push it up
					evalStack.push(nextToken);
				}
			}
			// if more than one value left on stack then too many operands given
			if (1 < evalStack.length) {
				alert("You supplied more numbers than needed. Did you miss something?");
				return;
			} else {
				// write to output, as integer if possible
				var finalResult = parseFloat(evalStack.pop());
				calcStr = "" + ((parseInt(finalResult) * 1.0) == finalResult ? parseInt(finalResult) : finalResult);
				resultInput.value = calcStr;
				resultInput.blur();
			}
			
		}
		this.eval2 = function(op, arg1, arg2) {
			var ret = 0;
			switch (op) {
				case DIVIDE:
					ret = 0 == arg2 ? '&infin;' : arg1 / arg2;
					break;
				case MULTIPLY:
					ret = arg1 * arg2;
					break;
				case SUBTRACT:
					ret = arg1 - arg2;
					break;
				case ADD:
					ret = arg1 + arg2;
					break;
			}
			return ret;
		}
	}
})();
</script>

<script type="text/javascript">
/*
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-11640584-2']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
*/
</script>




</html>