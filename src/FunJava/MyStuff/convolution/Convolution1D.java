package convolve;

import java.util.Calendar;

public class Convolution1D {
	
    public static class Timer                   //need static here to avoid error:non-static variable this cannot be referenced from a static context
    {
        
        public double startTimeInMicroSec;                 // starting time in micro-second
        public double endTimeInMicroSec;                   // ending time in micro-second
        public int  	stopped;                             // stop flag
        /*#ifdef WIN32
         LARGE_INTEGER frequency;                    // ticks per second
         LARGE_INTEGER startCount;                   //
         LARGE_INTEGER endCount;                     //
         #else*/
        public double startTime;                         //
        public double endTime;                           //
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
    
    public static class Convolution {
        
        public static boolean convolve1D(float[] in, float[] out, int dataSize, float[] kernel, int kernelSize)
        {
            int i, j, k;
            
            // check validity of params
            // if(!in || !out || !kernel) return false;
            if(dataSize <=0 || kernelSize <= 0) return false;
            
            // start convolution from out[kernelSize-1] to out[dataSize-1] (last)
            for(i = kernelSize-1; i < dataSize; ++i)
            {
                out[i] = 0;                             // init to 0 before accumulate
                
                for(j = i, k = 0; k < kernelSize; --j, ++k)
                    out[i] += in[j] * kernel[k];
            }
            
            // convolution from out[0] to out[kernelSize-2]
            for(i = 0; i < kernelSize - 1; ++i)
            {
                out[i] = 0;                             // init to 0 before sum
                
                for(j = i, k = 0; j >= 0; --j, ++k)
                    out[i] += in[j] * kernel[k];
            }
            
            return true;
        }
    };
    
    
    public static void  main(String[] args)
	{
	    float in[] = {3, 4, 5, 0, 0};
	    float out[] = {0, 0, 0, 0, 0};
	    float k[] = {2,1};
	    int i;
	    
	    Timer t = new Timer();

	    t.start();
	    Boolean success = Convolution.convolve1D(in, out, 5, k, 2);
	    t.stop();

	    if(success) System.out.println("SUCCESS, Elapsed Time: " + t.getElapsedTimeInMicroSec() + "us\n");
	    else        System.out.println("FAILED\n");

	    System.out.println("INPUT\n");
	    for(i=0; i < 5; ++i)
	    {
	    	System.out.println(in[i]);
	    }
	    System.out.println("\n\n");

	    System.out.println("KERNEL\n");
	    for(i=0; i < 2; ++i)
	    {
	    	System.out.println(k[i]);
	    }
	    System.out.println("\n\n");

	    System.out.println("OUTPUT\n");
	    for(i=0; i < 5; ++i)
	    {
	    	System.out.println(out[i]);
	    }
	    System.out.println("\n");

	    //return 0;
	}
}
