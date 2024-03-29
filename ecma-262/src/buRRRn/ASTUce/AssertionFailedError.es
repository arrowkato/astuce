
/*
  The contents of this file are subject to the Mozilla Public License Version
  1.1 (the "License"); you may not use this file except in compliance with
  the License. You may obtain a copy of the License at 
  http://www.mozilla.org/MPL/ 
  
  Software distributed under the License is distributed on an "AS IS" basis,
  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
  for the specific language governing rights and limitations under the License. 
  
  The Original Code is ASTUce: ActionScript Test Unit compact edition. 
  
  The Initial Developer of the Original Code is
  Zwetan Kjukov <zwetan@gmail.com>.
  Portions created by the Initial Developer are Copyright (C) 2004-2007
  the Initial Developer. All Rights Reserved.
  
  Contributor(s):
*/

/* Constructor: AssertionFailedError
   Thrown when an assertion failed.
*/
buRRRn.ASTUce.AssertionFailedError = function( /*String*/ message )
    {
    /* attention:
       we can not use
       Error.call( this, message );
    */
    this.message = message;
    /*!## TODO: define name property in prototype ? */
    this.name = "AssertionFailedError";
    }

buRRRn.ASTUce.AssertionFailedError.prototype = new Error();
buRRRn.ASTUce.AssertionFailedError.prototype.constructor = buRRRn.ASTUce.AssertionFailedError;

