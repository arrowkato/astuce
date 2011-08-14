/*
  The contents of this file are subject to the Mozilla Public License Version
  1.1 (the "License"); you may not use this file except in compliance with
  the License. You may obtain a copy of the License at 
  http://www.mozilla.org/MPL/ 
  
  Software distributed under the License is distributed on an "AS IS" basis,
  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
  for the specific language governing rights and limitations under the License. 
  
  The Original Code is [ASTUce: ActionScript Test Unit compact edition AS3]. 
  
  The Initial Developer of the Original Code is
  Zwetan Kjukov <zwetan@gmail.com>.
  Portions created by the Initial Developer are Copyright (C) 2006-2010
  the Initial Developer. All Rights Reserved.
  
  Contributor(s):
  Marc Alcaraz <ekameleon@gmail.com>.
  
*/

package buRRRn.ASTUce.tests.framework
{
    import buRRRn.ASTUce.framework.Test;
    import buRRRn.ASTUce.framework.TestCase;
    import buRRRn.ASTUce.framework.TestResult;
    import buRRRn.ASTUce.framework.Protectable;
    
    [ExcludeClass]
    public class DoubleTestCase implements Test
    {
        private var _testcase:TestCase;
        
        public function DoubleTestCase( testcase:TestCase )
        {
            _testcase = testcase;
        }
        
        public function get countTestCases():int
        {
            return 2;
        }
        
        public function run( result:TestResult ):void
        {
            result.startTest( this );
            
            var p:Protectable = new Protectable();
                p.protect = function():void
                {
                    _testcase.runBare();
                    _testcase.runBare();
                };
            
            result.runProtected( this, p );
            result.endTest( this );
        }
        
        public function toString( ...args ):String
        {
            return "2 x " + _testcase.toString();
        }
        
    }
}
