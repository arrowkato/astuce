
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
  Portions created by the Initial Developer are Copyright (C) 2006-2007
  the Initial Developer. All Rights Reserved.
  
  Contributor(s):
*/

package
    {
    import flash.display.Sprite;

    public class main extends Sprite
        {
        
        public function main()
            {
            import buRRRn.ASTUce.info;
            //import system.Serializer;
            //Serializer.prettyPrinting = true;
            //buRRRn.ASTUce.info( true, true );
            buRRRn.ASTUce.info( true, false );
            
            import buRRRn.ASTUce.tests.AllTests;
            import buRRRn.ASTUce.samples.AllTests;
            import buRRRn.ASTUce.Runner;
            
            Runner.main( buRRRn.ASTUce.tests.AllTests.suite(),
                         buRRRn.ASTUce.samples.AllTests.suite() );
            
            }
        }
    }
