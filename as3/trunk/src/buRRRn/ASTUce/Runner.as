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
    import core.strings.format; void(format);
    import core.reflect.getClassName; void(getClassName);
    import core.reflect.getClassMethods; void(getClassMethods);
    
    import system.terminals.InteractiveConsole;
    import system.terminals.console;
    
    import buRRRn.ASTUce.framework.*;
    import buRRRn.ASTUce.runner.BaseTestRunner;
    import buRRRn.ASTUce.runner.NullSuiteError;
    import buRRRn.ASTUce.ui.ResultPrinter;

    /**
     * This is the default TestRunner for ASTUce
     */
    public class Runner extends BaseTestRunner
    {
        private static var config:ASTUceConfigurator = metadata.config;
        private static var strings:Object = metadata.strings;
        
        /**
         * @private
         */
        private var _printer:*;

        /**
         * Display the header.
         */
        protected static function displayHeader():void
        {
            console.writeLine( metadata.info( true ) );
        }

        /**
         * Display the test infos.
         */
        protected static function displayInfos( suite:ITest, result:TestResult ):void
        {
            if( config.showConstructorList )
            {
                console.writeLine( suite );
            }
        }

        /**
         * Invoked when the runner failed.
         */
        protected override function runFailed( message:String ):void
        {
            console.writeLine( message );
        }

        /**
         * Creates a new Runner instance.
         * Using the given class writer if provided.
         * <p><b>Note :</b></p>
         * The default class writer for <code>ResultPrinter</code> is <code>system.terminals.console</code>.
         * For building a custom class writer, you have to define a class witch
         * implements <code>system.terminals.InteractiveConsole</code>.
         */
        public function Runner( writer:InteractiveConsole = null )
        {
            if( !writer )
            {
                writer = console;    
            }
            
            _printer = new ResultPrinter( writer );
        }
        
        /**
         * Indicates the printer of this runner.
         */
        public function get printer():*
        {
            return _printer;
        }
        
        /**
         * @private
         */
        public function set printer( printer:* ):void
        {
            _printer = printer;
        }
        
        /**
         * Returns the name of the test.
         * @return the name of the test.
         */
        public function getTestName( any:* ):String
        {
            if( any == null )
            {
                return "null";
            }
            
            if( any is String )
            {
                return any;
            }
            
            if( any is ITest )
            {
                return any.name;
            }
            
            if( any is Class )
            {
                return getClassName( any, true );
            }
            
            return "";
        }
        
        /**
         * Runs a multiple test and collects their results.
         */
        public static function main( ...args ):void
        {
            var result:TestResult;
            var runner:Runner = new Runner();
            var suiteName:String;
            
            displayHeader();
            
            for( var i:int = 0;i < args.length;i++ )
            {
                suiteName = runner.getTestName( args[i] );
                //console.writeLine( Strings.format( buRRRn.ASTUce.runner.strings.runTitle, suiteName, i ) );
                console.writeLine( format( strings.runTitle, suiteName, i ) );
                
                try
                {
                    result = run( args[i], runner );
                }
                catch( e1:NullSuiteError )
                {
                    runner.runFailed( strings.nullTestsuite );
                }
                catch( e2:Error )
                {
                    runner.runFailed( format( strings.canNotCreateAndRun, i) );
                    runner.runFailed( format( strings.tab, e2.toString()) );
                }
                
                console.writeLine( strings.separator );
            }
        }
        
        /**
         * Runs a single test and collects its results.
         * <p>This method can be used to start a test run from your program.</p>
         * 
         * <p>
         * In the case of a string parameter, the runner will first try to
         * locate a <code>static suite()</code> method, and if it can not find it 
         * then will try to extract a test suite automatically.
         * </p>
         * 
         * @param test Can be a <code>ITest</code> (<code>TestCase</code>,<code>TestSuite</code>,etc.),
         * a <code>Class</code> or a <code>String</code>
         */
        public static function run( test:*, runner:Runner = null ):TestResult
        {
            if( runner == null )
            {
                runner = new Runner();
                displayHeader();
            }
            
            var suite:ITest;
            
            
            if( test == null )
            {
                throw new NullSuiteError();
            }
            
            if( test is String )
            {
                suite = runner.getTest(test);
            }
            
            if( test is ITest )
            {
                suite = test;
            }
            
            if( test is Class )
            {
                var methods:Array = getClassMethods( test );
                var staticSuite:Function = null;
                if( methods.indexOf( "suite" ) > - 1 )
                {
                    staticSuite = test["suite"];
                }
                
                //var staticSuite:* = Reflection.getMethodByName( test, "suite" );
                
                if( staticSuite != null )
                {
                    suite = staticSuite();
                }
                else
                {
                    suite = new TestSuite( test );
                }
            }
            
            return runner.doRun(suite);
        }
        
        /**
         * Do the run process.
         */
        public function doRun( suite:ITest ):TestResult
        {
            var result:TestResult = new TestResult();
            result.addListener( printer );
            
            /* note:
            we use the Date class to not be dependent
            on flash getTimer()
             */
            var startTime:Number = new Date().valueOf();
            suite.run( result );
            var endTime:Number = new Date().valueOf();
            
            var runTime:Number = endTime - startTime;
            printer.print( result, runTime );
            
            displayInfos( suite, result );
            
            return result;
        }
    }
}
