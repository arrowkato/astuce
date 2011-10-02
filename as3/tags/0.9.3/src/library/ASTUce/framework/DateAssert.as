﻿/*
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
  Portions created by the Initial Developer are Copyright (C) 2006-2011
  the Initial Developer. All Rights Reserved.
  
  Contributor(s):
  Marc Alcaraz <ekameleon@gmail.com>.

*/

package library.ASTUce.framework
{
    
    /**
     * A set of assert methods specialized for Dates.
     * 
     * @example basic usage
     * <listing version="3.0">
     * <code class="prettyprint">
     * 
     * import buRRRn.ASTUce.framework.DateAssert ;
     * 
     * var d1:Date = new Date( "6/13/2008 8:18:15 AM" ) ;
     * var d2:Date = new Date( "6/13/2008 8:18:15 AM" ) ;
     * var d3:Date = new Date( "6/13/2008 8:17:15 AM" ) ;
     *  
     * DateAssert.assertEquals( d1 , d2 ) ; // is equals
     * 
     * DateAssert.assertEquals( d1 , d3 ) ;
     * // ComparisonFailure: expected:&lt;...8...&gt; but was:&lt;...7...&gt;
     * // at buRRRn.ASTUce.framework::DateAssert$/assertEquals()
     * 
     * </code>
     * </listing>
     */
    public class DateAssert extends Assert
    {
        
        /**
         * Asserts that any two Date are equal.
         * 
         * @throws <code>AssertionFailedError</code> If they are not equals.
         */   
        public static function assertEquals( expected:Date, actual:Date, message:String = "" ):void
        {
            if( expected == actual )
            {
                return;
            }
            
            var offset:Number = expected.getTimezoneOffset() ; 
            var diff:Number   = offset * 60 * 1000  ;
            
            var exp:Number = expected.valueOf() - diff ;
            var act:Number = actual.valueOf()   - diff ;
            
            if( exp != act )
            {
                throw new ComparisonFailure( expected.toString(), actual.toString() , message );
            }            
            
            Assert.assertEquals( exp, act, message );
        }
        
    }
}

