package convolve;


import java.util.Calendar;


public class Timer
{
	
	 private double startTimeInMicroSec;                 // starting time in micro-second
	 private double endTimeInMicroSec;                   // ending time in micro-second
	 private int  	stopped;                             // stop flag 
	/*#ifdef WIN32
	 LARGE_INTEGER frequency;                    // ticks per second
	 LARGE_INTEGER startCount;                   //
	 LARGE_INTEGER endCount;                     //
	#else*/
	 private double startTime;                         //
	 private double endTime;                           //
	//#endif
 
	 //This replaces gettimeofday()
	/* public void timeofday(){
		 Calendar cal = Calendar.getInstance();
		 int hour = cal.get(Calendar.HOUR_OF_DAY);
		 int minutes = cal.get(Calendar.MINUTE);
	 }*/
	 public void Timer(){
	
	 
	 
	 // default constructor
	/*#ifdef WIN32
    QueryPerformanceFrequency(&frequency);
    startCount.QuadPart = 0;
    endCount.QuadPart = 0;
#else*/
    startTime = 0;
    endTime = 0;
//#endif

    stopped = 0;
    startTimeInMicroSec = 0;
    endTimeInMicroSec = 0;
}
 
 public void start(){
	 // start timer
	 stopped = 0; // reset stop flag
	 /*#ifdef WIN32
	     QueryPerformanceCounter(&startCount);
	 #else*/
	    // timeofday();
	 //#endif
 }
 public void stop(){
	 // stop the timer
	 stopped = 1; // set timer stopped flag

	 /*#ifdef WIN32
	     QueryPerformanceCounter(&endCount);
	 #else*/
	   //  timeofday();
	// #endif
 }
 public double getElapsedTime(){
	 // get elapsed time in second
	 return getElapsedTimeInSec();
 }
 public double getElapsedTimeInSec(){
	 // get elapsed time in second (same as getElapsedTime)
	 return getElapsedTimeInMicroSec() * 0.000001;
 }
 public double getElapsedTimeInMilliSec(){
	 return getElapsedTimeInMicroSec() * 0.001;// get elapsed time in milli-second
 }
 public double getElapsedTimeInMicroSec(){
	 // get elapsed time in micro-second
	 /*#ifdef WIN32
	    if(!stopped)
	        QueryPerformanceCounter(&endCount);

	    startTimeInMicroSec = startCount.QuadPart * (1000000.0 / frequency.QuadPart);
	    endTimeInMicroSec = endCount.QuadPart * (1000000.0 / frequency.QuadPart);
	#else*/
	   /* if(stopped!=0)
	        timeofday();*/
	    startTime = System.nanoTime();
	    endTime = System.nanoTime();
	    startTimeInMicroSec = startTime *1000000000.0;
	    endTimeInMicroSec = endTime * 1000000000.0;
	//#endif

	    return endTimeInMicroSec - startTimeInMicroSec;
 }
 
};

/*
 * Destructor - Because Java is a garbage collected language you cannot predict when (or even if) 
 * an object will be destroyed. Hence there is no direct equivalent of a destructor. 
 * There is an inherited method called finalize, but this is called entirely at the 
 * discretion of the garbage collector.
 * #ifdef win32 should not be needed because java is designed to work on any os
 */

