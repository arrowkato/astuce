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

package library.ASTUce.runner
{
    import core.reflect.*;
    
    import library.ASTUce.framework.Test;
    import library.ASTUce.framework.TestListener;
    import library.ASTUce.framework.AssertionFailedError;
    import library.ASTUce.framework.TestSuite;
    
    import library.ASTUce.metadata;
    
    
    /**
     * Base class for all test runners.
     * 
     * <p><b>Note :</b></p>
     * <p>
     * This class is a mess in JUnit, so let keep it simple for now and
     * think about how to refactor that in a cleaner way...
     * </p>
     */
    public class BaseTestRunner implements TestListener, TestRunListener
    {
        
        /**
         * @private
         */
        private var _suiteMethodName:String = "suite"; //default
        
        /**
         * Creates a new BaseTestRunner instance.
         */
        public function BaseTestRunner()
        {
            
        }
        
        /**
         * An error occurred.
         */
        public static function getFilteredTrace( stack:String ):Array
        {
            var lines:Array = stack.split( "\n" );
            
            var preserveErrorMessage:String = lines.shift();
            
            if( !metadata.config.filterErrorStack )
            {
                return lines;
            }
            
            var filteredStack:Array  = [];
            filteredStack = lines.filter( filterLine );
            
            if( metadata.config.cleanupErrorStack )
            {
                filteredStack.forEach( cleanupLine );
            }
            
            filteredStack.unshift( preserveErrorMessage );
            
            return filteredStack;
        }
        
        /**
         * Filter the specified line.
         * @return <code>true</code> if the line is filter.
         */
        public static function filterLine( line:*, index:int = 0, arr:Array = null ):Boolean
        {
            var patterns:Array = metadata.config.filteredPatterns;
            
            if( patterns.length == 0 )
            {
                return true;
            }
            
            var i:int;
            for( i=0; i<patterns.length; i++ )
            {
                if( line.indexOf( patterns[i] ) > -1 )
                {
                    return false;
                }
            }
            
            return true;
        }
        
        /**
         * Cleanup the specified line.
         */
        public static function cleanupLine( line:*, index:int = 0, arr:Array = null ):void
        {
            arr[index] = line.replace( metadata.config.cleanupPattern , metadata.config.cleanupReplacement );
        }
        
        // implementation of <TestListener>
        
        /**
         * An error occurred.
         */
        public function addError( test:Test, e:Error ):void
        {
            testFailed( TestRunStatus.error, test.toString(), e.toString() );
        }
        
        /**
         * A failure occurred.
         */
        public function addFailure( test:Test, afe:AssertionFailedError ):void
        {
            testFailed( TestRunStatus.failure, test.toString(), afe.toString() );
        }
        
        /**
         * A valid test occurred.
         */
        public function addValid( test:Test ):void
        {
            
        }
        
        /**
         * A test ended.
         */
        public function endTest( test:Test ):void
        {
            testEnded( test.toString() );
        }
        
        /**
         * Invoked when the test is ended.
         */
        public function startTest( test:Test ):void
        {
            testStarted( test.toString() );
        }
        
        
        // implementation of <TestRunListener>
        
        public function testRunStarted( testSuiteName:String, testCount:int ):void
        {
            
        }
        
        /**
         * Invoked when the test process is ending.
         */        
        public function testRunEnded( elapsedTime:Number ):void
        {
            
        }
        
        /**
         * Invoked when the test process is stopped.
         */
        public function testRunStopped( elapsedTime:Number ):void
        {
            
        }
        
        /**
         * Invoked when the test is started.
         */
        public function testStarted( testName:String ):void
        {
            
        }
        
        /**
         * Invoked when the test is ended.
         */
        public function testEnded( testName:String ):void
        {
            
        }
        
        /**
         * Invoked when the test is failed.
         */
        public function testFailed( status:TestRunStatus, testName:String, trace:String ):void
        {
            
        }
        
        /**
         * Override to define how to handle a failed loading of a test suite.
         */
        protected function runFailed( message:String ):void
        {
            
        }
        
        /**
         * Clears the status message.
         */
        protected function clearStatus():void
        {
            
        }
        
        /**
         * Returns the Test corresponding to the given suite. 
         * This is a template method, subclasses override <code>runFailed()</code>, <code>clearStatus()</code>.
         */
        public function getTest( suiteClassName:String ):Test
        {
            if( (suiteClassName == "") || (suiteClassName == null) )
            {
                clearStatus();
                return null;
            }
            
            try
            {
                if( !hasDefinitionByName( suiteClassName ) )
                {
                    runFailed( "Class not found \"" + suiteClassName + "\"" );
                    return null;
                }
                
                var clazz:Class = getClassByName( suiteClassName );
            }
            catch( e1:Error )
            {
                runFailed( "Could not load \"" + suiteClassName + "\"" );                
                runFailed( "    " + e1.toString() );
                return null;
            }
            
            //var suiteMethod:Function = Reflection.getMethodByName( clazz, _suiteMethodName );
            var suiteMethod:Function;
            var methods:Array = getClassMethods( clazz );
            if( methods.indexOf( _suiteMethodName ) > -1 )
            {
                suiteMethod = clazz[ _suiteMethodName ] as Function;
            }
            
            if( suiteMethod == null )
            {
                // try to extract a test suite automatically
                clearStatus();
                return new TestSuite( clazz );
            }
            
            var test:Test;
            
            try
            {
                test = suiteMethod();
            }
            catch( e2:Error )
            {
                runFailed( "Failed to invoke suite():" + e2 );
                return null;
            }
            
            clearStatus();
            return test;
        }
        
    }
    
}

