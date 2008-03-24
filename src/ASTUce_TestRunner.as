
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
  Portions created by the Initial Developer are Copyright (C) 2006-2008
  the Initial Developer. All Rights Reserved.
  
  Contributor(s):
*/

package
    {
    import flash.display.Sprite;

    public class ASTUce_TestRunner extends Sprite
        {
        
        public function ASTUce_TestRunner()
            {
            
            import buRRRn.ASTUce.about;
            buRRRn.ASTUce.about( true, false );
            
            import buRRRn.ASTUce.tests.AllTests;
            import buRRRn.ASTUce.samples.*;
            //import buRRRn.ASTUce.samples.AllTests;
            //import buRRRn.ASTUce.samples.SimpleTest;
            import buRRRn.ASTUce.Runner;
            
            Runner.main( buRRRn.ASTUce.tests.AllTests.suite(),
                         buRRRn.ASTUce.samples.AllTests.suite(),
                         "buRRRn.ASTUce.samples.SimpleTest" );
            
            }
        }
    }
