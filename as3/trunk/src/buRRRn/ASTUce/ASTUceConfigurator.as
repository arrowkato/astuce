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
  Portions created by the Initial Developer are Copyright (C) 2006-2010
  the Initial Developer. All Rights Reserved.
  
  Contributor(s):
  Marc Alcaraz <ekameleon@gmail.com>.
  
*/

package buRRRn.ASTUce
{
    import core.dump; void(dump);
    
    /**
    * Configures the ASTUce framework.
    */
    public class ASTUceConfigurator
    {
        private var _config:Object;
        
        /**
         * Creates a new ASTUceConfigurator instance.
         * 
         * @param config This argument initialize the configurator with a generic object.
         */
        public function ASTUceConfigurator( config:Object = null )
        {
            _config = {};
            
            if( config )
            {
                load( config );
            }
        }
        
        /**
        * Copy all properties in the specified passed-in object in the internal config object of the Configurator.
        */
        public function load( config:Object ):void
        {
            for( var member:String in config )
            {
                _config[member] = config[member] ;
            }
        }
        
        public function toSource():String
        {
            return dump( _config, true );
        }
        
        /**
        * Boolean option to configure the getInfo method behaviour.
        * <p>
        * If the value is <code>true</code> more verbose else less verbose.
        * </p>
        */
        public function get verbose():Boolean
            {
            return _config.verbose;
            }
        
        /**
        * @private
        */
        public function set verbose( value:Boolean ):void
        {
            _config.verbose = value;
        }
        
        /**
         * Boolean option to display all the constructors being tested.
         * <p>If the value is <code>true</code> show constructors list else don't show constructor list.</p>
         * <p><b>Note: </b> Will show an indented list of tests</p>
         * 
         * @example output sample
         * <listing version="3.0">
         * <code class="prettyprint">
         * All ASTUce tests
         * {
         *      Framework Tests
         *      {
         *          TestCaseTest
         *          {
         *              testCaseToString( TestCaseTest )
         *              testRunAndTearDownFails( TestCaseTest )
         *              testWasRun( TestCaseTest )
         *              testError( TestCaseTest )
         *              ...
         * </code>
         * </listing>
         */
        public function get showConstructorList():Boolean
        {
            return _config.showConstructorList;
        }
        
        /**
        * @private
        */
        public function set showConstructorList( value:Boolean ):void
        {
            _config.showConstructorList = value;
        }
        
        /**
         * If false will show the full indentation
         * @example output sample
         * <listing version="3.0">
         * <code class="prettyprint">
         * All ASTUce tests
         * {
         *      Framework Tests
         *      {
         *          TestCaseTest
         *          {
         *              testCaseToString( TestCaseTest )
         *              testRunAndTearDownFails( TestCaseTest )
         *              testWasRun( TestCaseTest )
         *              testError( TestCaseTest )
         *              ...
         * </code>
         * </listing>
         * 
         * If true will show the indentation till the showSimpleTraceDepth.
         */
        public function get showAllAsSimpleTrace():Boolean
        {
            return _config.showAllAsSimpleTrace;
        }
        
        /**
        * @private
        */
        public function set showAllAsSimpleTrace( value:Boolean ):void
        {
            _config.showAllAsSimpleTrace = value;
        }
        
        /**
         * will limit the depth of description for constructors list
         * 
         * @example output sample
         * <listing version="3.0">
         * <code class="prettyprint">
         * All ASTUce tests
         * {
         *      Framework Tests
         *      {
         *          TestCaseTest
         *          {
         *              13 Tests ...
         *          }
         *          Suite tests
         *          {
         *              7 Tests ...
         *          }
         * </code>
         * </listing>
         */
        public function get showSimpleTraceDepth():int
        {
            return _config.showSimpleTraceDepth;
        }
        
        /**
         * @private
         */
        public function set showSimpleTraceDepth( value:int ):void
        {
            _config.showSimpleTraceDepth = value;
        }
        
        /**
         * Shows the short tests.
         * 
         * @example output sample
         * <listing version="3.0">
         * <code class="prettyprint">
         *  ...F..E...
         * </code>
         * </listing>
         */
        public function get showPrinterShortTests():Boolean
        {
            return _config.showPrinterShortTests;
        }
        
        /**
         * @private
         */
        public function set showPrinterShortTests( value:Boolean ):void
        {
            _config.showPrinterShortTests = value;
        }
        
        /** 
         * Need to be true to display:
         * 
         * <ul>
         * <li>printHeader</li>
         * <li>printErrors</li>
         * <li>printFailures</li>
         * <li>printFooter</li>
         * <li>empty tests</li>
         * </ul>
         */
        public function get showPrinterDetails():Boolean
        {
            return _config.showPrinterDetails;
        }
        
        /**
         * @private
         */
        public function set showPrinterDetails( value:Boolean ):void
        {
            _config.showPrinterDetails = value;
        }
        
        /**
         * show the header
         * 
         * @example output sample
         * <listing version="3.0">
         * <code class="prettyprint">
         *  Time: 0h:0mn:0s:10ms
         * </code>
         * </listing>
         */
        public function get showPrintHeader():Boolean
        {
            return _config.showPrintHeader;
        }
        
        /**
         * @private
         */
        public function set showPrintHeader( value:Boolean ):void
        {
            _config.showPrintHeader = value;
        }
        
        /**
         * Show the errors details.
         */
        public function get showPrintErrors():Boolean
        {
            return _config.showPrintErrors;
        }
        
        /**
         * @private
         */
        public function set showPrintErrors( value:Boolean ):void
        {
            _config.showPrintErrors = value;
        }
        
        /**
         * Show the failures details
         */
        public function get showPrintFailures():Boolean
        {
            return _config.showPrintFailures;
        }
        
        /**
         * @private
         */
        public function set showPrintFailures( value:Boolean ):void
        {
            _config.showPrintFailures = value;
        }
        
        /**
         * Show the footer.
         * 
         * @example output sample
         * <listing version="3.0">
         * <code class="prettyprint">
         * OK (10 tests)
         * </code>
         * </listing>
         */
        public function get showPrintFooter():Boolean
        {
            return _config.showPrintFooter;
        }
        
        /**
         * @private
         */
        public function set showPrintFooter( value:Boolean ):void
        {
            _config.showPrintFooter = value;
        }
        
        /**
         * Sometimes you add a test or a test suite that does not contain any tests,
         * il will show something as "unknown"
         * 
         * @example output sample
         * <listing version="3.0">
         * <code class="prettyprint">
         * [unknown]
         * </code>
         * </listing>
         */
        public function get showEmptyTests():Boolean
        {
            return _config.showEmptyTests;
        }
        
        /**
         * @private
         */
        public function set showEmptyTests( value:Boolean ):void
        {
            _config.showEmptyTests = value;
        }
        
        /**
         * Boolean option to display the source of objects being compared.
         * <p>If the value is <code>true</code> show the object source else don't show the source.</p>
         * <p><b>Note :</b>It help you to debug to see</p>
         * 
         * @example output sample with object source
         * <listing version="3.0">
         * <code class="prettyprint">
         * AssertionFailedError : expected:&lt;{a:1,b:2,c:3}&gt; but was:&lt;{a:1,b:2,c:4}&gt;
         * </code>
         * </listing>
         * 
         * @example output sample without object source
         * <listing version="3.0">
         * <code class="prettyprint">
         * AssertionFailedError : expected:&lt;[object Object]&gt; but was:&lt;[object Object]&gt;
         * </code>
         * </listing>
         */
        public function get showObjectSource():Boolean
        {
            return _config.showObjectSource;
        }
        
        /**
         * @private
         */
        public function set showObjectSource( value:Boolean ):void
        {
            _config.showObjectSource = value;
        }
        

        public function get invertExpectedActual():Boolean
        {
            return _config.invertExpectedActual;
        }
        
        /**
         * @private
         */
        public function set invertExpectedActual( value:Boolean ):void
        {
            _config.invertExpectedActual = value;
        }
        
        /**
         * Boolean option allowing to iterate or not trough inherited tests.
         * <p>If is <b>true</b> iterate inherited tests.</p>
         * <p><b>Note :</b></p>
         * <p>If you set this option to false the following test <code>SuiteTest( testInheritedTests )</code> will fail.</p>
         * <p>Hopefully the failure message should direct you here ;).</p>
         * 
         * @example message failure
         * <listing version="3.0">
         * <code class="prettyprint">
         * 0) testInheritedTests( SuiteTest )
         *    AssertionFailedError: see buRRRn.ASTUce.config.testInheritedTests
         *        at buRRRn.ASTUce.framework::Assert$/fail()
         *        at buRRRn.ASTUce.framework::Assert$/assertTrue()
         *        at buRRRn.ASTUce.tests.framework::SuiteTest/testInheritedTests()
         * </code>
         * </listing>
         */
        public function get testInheritedTests():Boolean
        {
            return _config.testInheritedTests;
        }
        
        /**
         * @private
         */
        public function set testInheritedTests( value:Boolean ):void
        {
            _config.testInheritedTests = value;
        }
        
        /**
         * Indicates the max columns chars to display before returning to the line.
         * <p>only usefull to print short tests/failures/errors.</p>
         */
        public function get maxColumn():int
        {
            return _config.maxColumn;
        }
        
        /**
         * @private
         */
        public function set maxColumn( value:int ):void
        {
            _config.maxColumn = value;
        }
        
        /**
         * Defect the header as error.
         */
        public function get defectHeaderAsError():Boolean
        {
            return _config.defectHeaderAsError;
        }
        
        /**
         * @private
         */
        public function set defectHeaderAsError( value:Boolean ):void
        {
            _config.defectHeaderAsError = value;
        }
        
        /**
         * Indicates if the error trace is allowed.
         */
        public function get allowErrorTrace():Boolean
        {
            return _config.allowErrorTrace;
        }
        
        /**
         * @private
         */
        public function set allowErrorTrace( value:Boolean ):void
        {
            _config.allowErrorTrace = value;
        }
        
        /**
         * Indicates if the stack trace is allowed.
         */
        public function get allowStackTrace():Boolean
        {
            return _config.allowStackTrace;
        }
        
        /**
         * @private
         */
        public function set allowStackTrace( value:Boolean ):void
        {
            _config.allowStackTrace = value;
        }
        
        /**
         * Indicates if the filter error stack is allowed.
         * Allow to use the filteredPatterns array to filter or not the errors stack trace 
         * set it to false if you want the full stack.
         */
        public function get filterErrorStack():Boolean
        {
            return _config.filterErrorStack;
        }
        
        /**
         * @private
         */
        public function set filterErrorStack( value:Boolean ):void
        {
            _config.filterErrorStack = value;
        }
        
        public function get cleanupErrorStack():Boolean
        {
            return _config.cleanupErrorStack;
        }
        
        /**
         * @private
         */
        public function set cleanupErrorStack( value:Boolean ):void
        {
            _config.cleanupErrorStack = value;
        }
        
        
        /**
         * The cleanup setting value.
         */
        public function get cleanupPattern():RegExp
        {
            return _config.cleanupPattern;
        }
        
        /**
         * @private
         */
        public function set cleanupPattern( value:RegExp ):void
        {
            _config.cleanupPattern = value;
        }
        
        /**
         * Indicates the cleanup replacement value. 
         */
        public function get cleanupReplacement():String
        {
            return _config.cleanupReplacement;
        }
        
        /**
         * @private
         */
        public function set cleanupReplacement( value:String ):void
        {
            _config.cleanupReplacement = value;
        }
        
        public function get filteredPatterns():Array
        {
            return _config.filteredPatterns;
        }
        
        /**
         * @private
         */
        public function set filteredPatterns( value:Array ):void
        {
            _config.filteredPatterns = value;
        }
        
    }
    
}

