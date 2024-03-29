
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
  Portions created by the Initial Developer are Copyright (C) 2004-2006
  the Initial Developer. All Rights Reserved.
  
  Contributor(s):
*/

Tests.ASTUce.samples.AllTests = function( /*String*/ name )
    {
    buRRRn.ASTUce.TestCase.call( this, name );
    }

Tests.ASTUce.samples.AllTests.prototype = new buRRRn.ASTUce.TestCase();
Tests.ASTUce.samples.AllTests.prototype.constructor = Tests.ASTUce.samples.AllTests;

Tests.ASTUce.samples.AllTests.suite = function()
    {
    var TestSuite, suite;
    
    TestSuite = buRRRn.ASTUce.TestSuite;
    suite     = new TestSuite( "samples Tests" );
    
    suite.addTest( new TestSuite( Tests.ASTUce.samples.ArrayTest, "ArrayTest" ) );
    suite.addTest( new TestSuite( Tests.ASTUce.samples.MoneyTest, "MoneyTest" ) );
    
    /* attention:
       the SimpleTest TestSuite will generate 4 failures
    */
    suite.addTest( new TestSuite( Tests.ASTUce.samples.SimpleTest, "SimpleTest" ) );
    
    return suite;
    }

