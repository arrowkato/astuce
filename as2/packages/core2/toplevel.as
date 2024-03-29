
/*
  The contents of this file are subject to the Mozilla Public License Version
  1.1 (the "License"); you may not use this file except in compliance with
  the License. You may obtain a copy of the License at 
  http://www.mozilla.org/MPL/ 
  
  Software distributed under the License is distributed on an "AS IS" basis,
  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
  for the specific language governing rights and limitations under the License. 
  
  The Original Code is core2: ECMAScript core objects 2nd gig AS2. 
  
  The Initial Developer of the Original Code is
  Zwetan Kjukov <zwetan@gmail.com>.
  Portions created by the Initial Developer are Copyright (C) 2003-2006
  the Initial Developer. All Rights Reserved.
  
  Contributor(s):
*/

//****************************************************************************
// ActionScript Standard Library
// Top-level functions
//****************************************************************************

intrinsic var _focusRect:Boolean;
intrinsic var _global:Object;
intrinsic var _highquality:Number;
intrinsic var _quality:String;
intrinsic var _root:MovieClip;
intrinsic var _soundbuftime:Number;

intrinsic var $version:Number;

intrinsic var Infinity:Number;
intrinsic var NaN:Number;

intrinsic function call(frame:Object):Void; // param 1 can be String or Number
intrinsic function clearInterval(id:Number):Void;
intrinsic function duplicateMovieClip(target:String, newName:String, depth:Number):Void;
intrinsic function escape(value:String):String;
intrinsic function eval(expr:String):Object;
intrinsic function fscommand(command:String, parameters:String):Void;
intrinsic function getProperty(movieClip:Object, property:Object):Object;
intrinsic function getTimer():Number;
intrinsic function getURL(url:String, window:String, method:String):Void;
intrinsic function getVersion():String;
intrinsic function gotoAndPlay(sceneOrFrame:Object, frame:Object):Void; // parameters can be different types
intrinsic function gotoAndStop():Void; // parameters can be different types
intrinsic function int(num:Number):Number;
intrinsic function isFinite(value:Object):Boolean;
intrinsic function isNaN(value:Object):Boolean;
intrinsic function loadMovie(url:String, target:Object, method:String):Void;
intrinsic function loadMovieNum(url:String, level:Number, method:String):Void;
intrinsic function loadVariables(url:String, target:Object, method:String):Void;
intrinsic function loadVariablesNum(url:String, level:Number, method:String):Void;
intrinsic function nextFrame():Void;
intrinsic function nextScene():Void;
intrinsic function parseFloat(value:String):Number;
intrinsic function parseInt(value:String,radix:Number):Number;
intrinsic function play():Void;
intrinsic function prevFrame():Void;
intrinsic function prevScene():Void;
intrinsic function profile(enable:Boolean):Void;
intrinsic function print(target:Object, boundingBox:String):Void;
intrinsic function printAsBitmap(target:Object, boundingBox:String):Void;
intrinsic function printAsBitmapNum(level:Number, boundingBox:String):Void;
intrinsic function printNum(level:Number, boundingBox:String):Void;
intrinsic function random(num:Number):Number;
intrinsic function removeMovieClip(target:Object):Void;
intrinsic function setInterval():Number;
intrinsic function setProperty(movieClip:Object, property:Object, value:Object):Void;
intrinsic function showRedrawRegions(enable:Boolean):Void;
intrinsic function startDrag(target:Object, lockCenter:Boolean, left:Number, top:Number, right:Number, bottom:Number):Void;
intrinsic function stop():Void;
intrinsic function stopAllSounds():Void;
intrinsic function stopDrag():Void;
intrinsic function targetPath(mc:MovieClip):String;
intrinsic function toggleHighQuality():Void;
intrinsic function trace(value:String):Void;
intrinsic function unescape(value:String):String;
intrinsic function unloadMovie(target):Void;
intrinsic function unloadMovieNum(level:Number):Void;
intrinsic function updateAfterEvent():Void;

intrinsic function MMExecute(expr:String);

/*
  core2: ECMAScript core objects 2nd gig.
  
  Patch the _global object to compile for
  ActionScript v2.0 without causing compiler errors.
  
  attention:
  You have to include the ActionScript v1.0 files to
  be able to use these new features.
*/

intrinsic function GetObjectPath( target:Object, scope ):String;
intrinsic function GetTypeOf( obj ):String;
intrinsic function hasOwnProperty( name:String ):Boolean;
intrinsic function isGlobalReserved( name:String ):Boolean;
intrinsic function propertyIsEnumerable( name:String ):Boolean;
intrinsic function ToSource( /*int*/ indent:Number, indentor:String ):String;

#endinitclip
