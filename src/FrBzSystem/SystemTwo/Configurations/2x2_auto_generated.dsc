// Description file template used for generating a 2 by 2 target system.
// Based on the systwo-8x8-description.dsc file.

// Called from runSystemNxNMainSim.java.

// Cloned from system-one-descr.txt of SystemOneTestRev

// Description of Fresh Breeze System One
// ======================================
// August 29, 2012 - Jack Dennis
//
// Revision: November 19, 2012
// Revision: November 27, 2012
//

// First Test System including a single ProcessorCore
// with Core scheduler, Auto Buffer and one Memory Unit

// First Test System including a single ProcessingUnit
// with Core scheduler, and one Memory Unit


// Two Processing Units and Two Memory Units
//          Start
//          +----+
//       +--+ 0  |
//       |  |    |
//  +----|--+ 1  +
//  |    |  +----+
//  |    |
//  |    |  +-----------------------------------------+
//  |    |  |  Initializer                            |
//  |    |  |   +------+                              |
//  |    +--+-->+ 0  0 +---------------+              |
//  |           |    1 +---------+     |              |
//  |       +-->+ 1  2 +--+      |     |              |
//  |       |   +------+  |      |     |  .......................
//  |       |             |      |     |  . ProcUnit0 |         .
//  |       |             |      |     |  .  +------+ |         .
//  |       |             |      |     |  ..>+ 0  0 +-------------+
//  |       |             |      |   +------>+ 1  1 +.|....     . |
//  |       +----------------------+ | | +-->+ 2  2 +---+ .     . |
//  |          Scheduler0 |      | | | +-|-->+ 3  3 +-+ | .     . |
//  |           +------+  |      | | |   |   +------+   | .     . |
//  |    ......>+ 0  0 +-------------+   +--------------+ .     . |   P2MRouter     MemUnit0
//  |  +-.----->+ 1  1 +--|----+ | |                      .     . |    +-----+       +-----+
//  |  | . +--->+ 2  2 +-----+ | | |                      .     . +--->+ 0 0 +------>+ 0 0 +--+
//  |  | . |    +------+  |  | | | |                      .     .      |     |       +-----+  |
//  |  | ..................................................     . +--->+ 1 1 +.....           |
//  |  |   |              |  | | | |                            . |    +-----+    .           |
//  |  |   | LoadBalancer |  | | | |                            . |             +-.-----------+
//  |  |   |    +------+  |  | | | +------------------+         . |   M2PRouter | . MemUnit1
//  |  +---|----+ 0  0 +<-|--|-+ |                    |         . |    +-----+  | .  +-----+
//  |    +-|--->+ 1  1 +<.|..|   +---+    ............|.......  .......+ 0 0 +<-+ ..>+ 0 0 +--+
//  +----|-|--->+ N    |  | .|       |    . ProcUnit1 |      .    |    |     |       +-----+  |
//       | |    |   N+3+<-+ .|       |    .  +------+ |      .    |  ..+ 1 1 +<---------------+
//       | |    +------+    .|       |    ..>+ 0  0 +-|-----------+  . +-----+
//       | | +---------------+  +----------->+ 1  1 +.|....  .       .
//       | | |              .   |    |   +-->+ 2  2 +---+ .  .       .
//       | | |              .   |    ----|-->+ 3  3 +-+ | .  .       .
//       | | | Scheduler1   .   |        |   +------+   | .  .       .
//       | | |  +------+    .   |        |              | .   ........
//     ..|.....>+ 0  0 +--------+        +--------------+ .
//     . +-|-|->+ 1  1 +.....                             .
//     .   | +->+ 2  2 +---+                              .
//     .   |    +------+   |                              .
//     .   |               |                              .
//     .   +---------------+                              .
//     ....................................................
//
//
//
//
//  2x2 Router
//  ==========
//
//    Distributer0         Arbiter0
//      +------+           +------+
//    ->+ 0  0 +>+++++++++>+ 0  0 +>
//      |      |           |      |
//      |      |           |      |
//      |    1 +>++     ..>+ 1    |
//      +------+   +   .   +------+
//                  + .
//                   +
//    Distributer1  . +    Arbiter1
//      +------+   .   +   +------+
//    ->+ 0  0 +>..     ++>+ 0  0 +>
//      |      |           |      |
//      |      |           |      |
//      |    1 +>.........>+ 1    |
//      +------+           +------+
//
//
//
//  4x4 Configuration with 8 2x2 routers for the 2 4x4 routing network (4 2x2 in each 4x4 routing network)
//  ======================================================================================================
//
//                                       P2MStage0                    P2MStage1
//      Proc0                             Router0                      Router0                           MemUnit0
//     +------+ ABOut0                    +------+                     +------+                  MemIn0  +------+
//     |    0 +>+++++++++++++++++++++++++>+ 0  0 +>+++++++++++++++++++>+ 0  0 +>++++++++++++++++++++++++>+      |
//     |      |                           |      |                     |      |                          |      |
//     |      | ABIn0                     |      |                     |      |                  MemOut0 |      |
//     |    0 +<********     ++++++++++++>+ 1  1 +>++     ++++++++++++>+ 1  1 +>++              ********<+ 0    |
//     +------+         *   +             +------+   +   +             +------+   +            *         +------+
//                       * +                          + +                          +          *
//                        +              P2MStage0     +              P2MStage1     +        *
//      Proc1            + *              Router1     + +              Router1       +      *            MemUnit1
//     +------+ ABOut1  +   *             +------+   +   +             +------+       +    *     MemIn1  +------+
//     |    0 +>++++++++     *  +++++++++>+ 0  0 +>++     ++++++++++++>+ 0  0 +>+++    +++*+++++++++++++>+ 0    |
//     |      |               *+          |      |                     |      |    +     *               |      |
//     |      | ABIn1         +*          |      |                     |      |     +   *        MemOut1 |      |
//     |    0 +<*******      +  *     +++>+ 1  1 +>+++++++++++++++++++>+ 1  1 +>+    + *        ********<+ 0    |
//     +------+        *    +    *   +    +------+                     +------+  +    *        *         +------+
//                      *  +      * +                                             +  * +      *
//                       *+        *     M2PStage1                    M2PStage0    +*   +    *
//      Proc2            +*       + *     Router0                      Router0     *+    +  *            MemUnit2
//     +------+ ABOut2  +  *     +   *    +------+                     +------+   *  +    +*     MemIn2  +------+
//     |    0 +>++++++++    *   +     ***<+ 0  0 +<*******************<+ 0  0 +<**    +   *+++++++++++++>+ 0    |
//     |      |              * +          |      |                     |      |        + *               |      |
//     |      | ABIn2         +           |      |                     |      |         *        MemOut2 |      |
//     |    0 +<********     + **********<+ 1  1 +<**     ************<+ 1  1 +<******** +  ************<+ 0    |
//     +------+         *   +             +------+   *   *             +------+           +*             +------+
//                       * +                          * *                                 *+
//                        +              M2PStage1     *              M2PStage0          *  +
//      Proc3            + *              Router1     * *              Router1          *    +           MemUnit3
//     +------+ ABOut3  +   *             +------+   *   *             +------+        *      +  MemIn3  +------+
//     |    0 +>++++++++     ************<+ 0  0 +<**     ************<+ 0  0 +<*******        +++++++++>+ 0    |
//     |      |                           |      |                     |      |                          |      |
//     |      | ABIn3                     |      |                     |      |                  MemOut3 |      |
//     |    0 +<*************************<+ 1  1 +<*******************<+ 1  1 +<************************<+ 0    |
//     +------+                           +------+                     +------+                          +------+
//
//

systemtwo SysTwo2x2DotProduct {

   // Declarations

   //  2x2 Router
   //  ==========
   //
   //      dists[0]            arbs[0]
   //      +------+           +------+
   //    ->+ 2  0 +>+++++++++>+ 0  2 +>
   //      |      |           |      |
   //      |      |           |      |
   //      |    1 +>++     ..>+ 1    |
   //      +------+   +   .   +------+
   //                  + .
   //                   +
   //      dists[1]    . +     arbs[1]
   //      +------+   .   +   +------+
   //    ->+ 2  0 +>..     ++>+ 0  2 +>
   //      |      |           |      |
   //      |      |           |      |
   //      |    1 +>.........>+ 1    |
   //      +------+           +------+

   module CommandRouter (4, 4)
      nodes {
        // Distributers and arbiters for 2x2
       ensemble dists (2, component, SysTwoDistributer);
       ensemble arbs  (2, component, SysTwoCommandArbiter);
       } // End of CommandRouter nodes
       connections {

          // Connect input ports of the router to distributers
          // Input data ports are numbered 0 and 1
          // Ack (output) ports for input data port i is number i+2
          // Output data ports are numbered 0 and 1
          // Ack (input) ports for output data port i is number i+2

          for (0 .. 1) => i {
         // Connect input ports of the router to the distributers
             input[i]     => dists[i][2];  // CommandRouter data input port i
             dists[i][2]  => output[i+2];  // Port i+2 is ack port for router input port 0

             // Connect arbiters to output ports of the router
             arbs[i][2]   => output[i];    // CommandRouter data output port i
             input[i+2]   => arbs[i][2]; // Port i+2 is ack port for output port 0

             // Interconnect the arbiters and distributers
             // Interconnect the arbiters and distributers
             dists[0][i%2]  => arbs[i%2][0];   // Output port i%2 (data) of distributer 0 to input port 0 (data) of arbiter i%2
             arbs[i%2][0]   => dists[0][i%2];  // Output port 0 (ack) of arbiter i%2 to input port i%2 (ack) of distributer 0
             dists[1][i%2]  => arbs[i%2][1];   // Output port i%2 (data) of distributer 1 to input port 1 (data) of arbiter i%2
             arbs[i%2][1]   => dists[1][i%2];  // Output port 1 (ack) of arbiter i%2 to input port i%2 (ack) of distributer 1
         }      

       } // End of CommandRouter connections
   } // End of CommandRouter module definition

   // A column of 1 2x2 Command routers - 4 input and 4 output data ports
   module CommandRouterColumn (4, 4)
      nodes {
         // Ensemble of 2x2 CommandRouters
         ensemble CommandRouters (1, module, CommandRouter);
         } // End nodes
      connections {
         for (0 .. 1) => p {
            set p + 2 => ackPortNumber;
            set p/2 => routerRowNumber;
            set p % 2 => routerDataPortNumber;
            set routerDataPortNumber + 2 => routerAckPortNumber;
            input[p] => CommandRouters[routerRowNumber][routerDataPortNumber];             // Input data ports
            CommandRouters[routerRowNumber][routerAckPortNumber] => output[ackPortNumber]; // Ack links for input data ports

            CommandRouters[routerRowNumber][routerDataPortNumber] => output[p];           // Output data ports
            input[ackPortNumber] => CommandRouters[routerRowNumber][routerAckPortNumber]; // Ack links for input data ports
        }
         } // End connections
     } // End of CommandRouterColumn module definition
   module CommandNetwork (4, 4)
      nodes {
        ensemble CommandRouterStages (1, module, CommandRouterColumn);
      } // end of node declarations
      // Connections
      connections {
         input[0] => CommandRouterStages[0][0]; // Data
         CommandRouterStages[0][2] => output[2]; // Ack
         CommandRouterStages[0][0] => output[0]; // Data
         input[2] => CommandRouterStages[0][2];  // Ack
         input[1] => CommandRouterStages[0][1]; // Data
         CommandRouterStages[0][3] => output[3]; // Ack
         CommandRouterStages[0][1] => output[1]; // Data
         input[3] => CommandRouterStages[0][3];  // Ack
      } // end connections
   } // end CommandNetwork module definition
   module ResponseRouter (4, 4)
      nodes {
        // Distributers and arbiters for 2x2
       ensemble dists (2, component, SysTwoDistributer);
       ensemble arbs  (2, component, SysTwoResponseArbiter);
       } // End of ResponseRouter nodes
       connections {

          // Connect input ports of the router to distributers
          // Input data ports are numbered 0 and 1
          // Ack (output) ports for input data port i is number i+2
          // Output data ports are numbered 0 and 1
          // Ack (input) ports for output data port i is number i+2

          for (0 .. 1) => i {
         // Connect input ports of the router to the distributers
             input[i]     => dists[i][2];  // ResponseRouter data input port i
             dists[i][2]  => output[i+2];  // Port i+2 is ack port for router input port 0

             // Connect arbiters to output ports of the router
             arbs[i][2]   => output[i];    // ResponseRouter data output port i
             input[i+2]   => arbs[i][2]; // Port i+2 is ack port for output port 0

             // Interconnect the arbiters and distributers
             // Interconnect the arbiters and distributers
             dists[0][i%2]  => arbs[i%2][0];   // Output port i%2 (data) of distributer 0 to input port 0 (data) of arbiter i%2
             arbs[i%2][0]   => dists[0][i%2];  // Output port 0 (ack) of arbiter i%2 to input port i%2 (ack) of distributer 0
             dists[1][i%2]  => arbs[i%2][1];   // Output port i%2 (data) of distributer 1 to input port 1 (data) of arbiter i%2
             arbs[i%2][1]   => dists[1][i%2];  // Output port 1 (ack) of arbiter i%2 to input port i%2 (ack) of distributer 1
         }      

       } // End of ResponseRouter connections
   } // End of ResponseRouter module definition

   // A column of 1 2x2 Response routers - 4 input and 4 output data ports
   module ResponseRouterColumn (4, 4)
      nodes {
         // Ensemble of 2x2 ResponseRouters
         ensemble ResponseRouters (1, module, ResponseRouter);
         } // End nodes
      connections {
         for (0 .. 1) => p {
            set p + 2 => ackPortNumber;
            set p/2 => routerRowNumber;
            set p % 2 => routerDataPortNumber;
            set routerDataPortNumber + 2 => routerAckPortNumber;
            input[p] => ResponseRouters[routerRowNumber][routerDataPortNumber];             // Input data ports
            ResponseRouters[routerRowNumber][routerAckPortNumber] => output[ackPortNumber]; // Ack links for input data ports

            ResponseRouters[routerRowNumber][routerDataPortNumber] => output[p];           // Output data ports
            input[ackPortNumber] => ResponseRouters[routerRowNumber][routerAckPortNumber]; // Ack links for input data ports
        }
         } // End connections
     } // End of ResponseRouterColumn module definition
   module ResponseNetwork (4, 4)
      nodes {
        ensemble ResponseRouterStages (1, module, ResponseRouterColumn);
      } // end of node declarations
      // Connections
      connections {
         input[0] => ResponseRouterStages[0][0]; // Data
         ResponseRouterStages[0][2] => output[2]; // Ack
         ResponseRouterStages[0][0] => output[0]; // Data
         input[2] => ResponseRouterStages[0][2];  // Ack
         input[1] => ResponseRouterStages[0][1]; // Data
         ResponseRouterStages[0][3] => output[3]; // Ack
         ResponseRouterStages[0][1] => output[1]; // Data
         input[3] => ResponseRouterStages[0][3];  // Ack
      } // end connections
   } // end ResponseNetwork module definition
   module TaskRecordRouter (4, 4)
      nodes {
        // Distributers and arbiters for 2x2
       ensemble dists (2, component, SysTwoDistributer);
       ensemble arbs  (2, component, SysTwoTaskRecordArbiter);
       } // End of TaskRecordRouter nodes
       connections {

          // Connect input ports of the router to distributers
          // Input data ports are numbered 0 and 1
          // Ack (output) ports for input data port i is number i+2
          // Output data ports are numbered 0 and 1
          // Ack (input) ports for output data port i is number i+2

          for (0 .. 1) => i {
         // Connect input ports of the router to the distributers
             input[i]     => dists[i][2];  // TaskRecordRouter data input port i
             dists[i][2]  => output[i+2];  // Port i+2 is ack port for router input port 0

             // Connect arbiters to output ports of the router
             arbs[i][2]   => output[i];    // TaskRecordRouter data output port i
             input[i+2]   => arbs[i][2]; // Port i+2 is ack port for output port 0

             // Interconnect the arbiters and distributers
             // Interconnect the arbiters and distributers
             dists[0][i%2]  => arbs[i%2][0];   // Output port i%2 (data) of distributer 0 to input port 0 (data) of arbiter i%2
             arbs[i%2][0]   => dists[0][i%2];  // Output port 0 (ack) of arbiter i%2 to input port i%2 (ack) of distributer 0
             dists[1][i%2]  => arbs[i%2][1];   // Output port i%2 (data) of distributer 1 to input port 1 (data) of arbiter i%2
             arbs[i%2][1]   => dists[1][i%2];  // Output port 1 (ack) of arbiter i%2 to input port i%2 (ack) of distributer 1
         }      

       } // End of TaskRecordRouter connections
   } // End of TaskRecordRouter module definition

   // A column of 1 2x2 TaskRecord routers - 4 input and 4 output data ports
   module TaskRecordRouterColumn (4, 4)
      nodes {
         // Ensemble of 2x2 TaskRecordRouters
         ensemble TaskRecordRouters (1, module, TaskRecordRouter);
         } // End nodes
      connections {
         for (0 .. 1) => p {
            set p + 2 => ackPortNumber;
            set p/2 => routerRowNumber;
            set p % 2 => routerDataPortNumber;
            set routerDataPortNumber + 2 => routerAckPortNumber;
            input[p] => TaskRecordRouters[routerRowNumber][routerDataPortNumber];             // Input data ports
            TaskRecordRouters[routerRowNumber][routerAckPortNumber] => output[ackPortNumber]; // Ack links for input data ports

            TaskRecordRouters[routerRowNumber][routerDataPortNumber] => output[p];           // Output data ports
            input[ackPortNumber] => TaskRecordRouters[routerRowNumber][routerAckPortNumber]; // Ack links for input data ports
        }
         } // End connections
     } // End of TaskRecordRouterColumn module definition
   module TaskRecordNetwork (4, 4)
      nodes {
        ensemble TaskRecordRouterStages (1, module, TaskRecordRouterColumn);
      } // end of node declarations
      // Connections
      connections {
         input[0] => TaskRecordRouterStages[0][0]; // Data
         TaskRecordRouterStages[0][2] => output[2]; // Ack
         TaskRecordRouterStages[0][0] => output[0]; // Data
         input[2] => TaskRecordRouterStages[0][2];  // Ack
         input[1] => TaskRecordRouterStages[0][1]; // Data
         TaskRecordRouterStages[0][3] => output[3]; // Ack
         TaskRecordRouterStages[0][1] => output[1]; // Data
         input[3] => TaskRecordRouterStages[0][3];  // Ack
      } // end connections
   } // end TaskRecordNetwork module definition


   end;
   } nodes {

   // Node Declarations (Component Instances) (componentClass, optional_coreIndex)
   component Start (SysTwoStart);
   component Initializer (SysTwoInitializer, 0, 2, 2); // set dummy coreidx to 0, input/ouput data port count to size);

   // 2 (= size) Processing Units
   ensemble Cores (2, component, SysTwoProcessingUnit);  // (number of components, component or module, className, optional-coreIndex)
   ensemble Schedulers (2, component, SysTwoCoreSched);
   component LoadBalancer (SysTwoLoadBalancer, 0, 2, 2); // set dummy coreidx to 0, input/ouput data port count to size);


   // 1 columns of 2 2x2 routers, one for each stage of the routing network

   // Processing units to memory units (memory commands) direction 2x2 (1 stages of 2 2x2 routers)
   module P2MNetwork (CommandNetwork);

   // Memory units to processing units (memory responses) direction 2x2 (1 stages of 2 2x2 routers)
   module M2PNetwork (ResponseNetwork);

   // TaskRecordNetwork: interconnecting the core schedulers
   module BalancingNetwork(TaskRecordNetwork);

   // 2 (= size) Memory Banks
   ensemble MemUnits (2, component, SysTwoMemUnit);

   } // end of node specifications


   // Connections
   connections {

      set 2 * 2 => twoTimesNumberOfProcessingUnits;

      // Processing Units

      Start[0] => Initializer[0];       // StartSim

      // Connection to initiate load balancing from Start (shared with LB continue port)
      Start[1]  => LoadBalancer[twoTimesNumberOfProcessingUnits];

      // Connection to stop load balancing from the Initializer
//      Initializer[2]  => LoadBalancer[twoTimesNumberOfProcessingUnits + 1]; // BalancerStop
      Initializer[2]  => LoadBalancer[twoTimesNumberOfProcessingUnits + 1]; // BalancerStop

      // Connection to continue load balancing
      LoadBalancer[ twoTimesNumberOfProcessingUnits]  => LoadBalancer[twoTimesNumberOfProcessingUnits];

      for (0 .. 2 - 1) => c {
          Initializer[c] => Cores[c][3];     // SimInit, StartSim
          Cores[c][3]  => Initializer[c];    // InitDone

          Schedulers[c][0] => Cores[c][1]; // SchedDataItem

          Cores[c][1] => Schedulers[c][0]; // SchedDataItem
          Cores[c][2] => Cores[c][2];      // ProcDataItem

          // Connect the LoadBalancer to the CoreSchedulers
          LoadBalancer[c]    => Schedulers[c][1];  // SchedTake
//          Schedulers[c][1] => LoadBalancer[2 + 1];  // SendToAck
          Schedulers[c][1] => LoadBalancer[2 + c];  // SendToAck (ack for SchedTake received from Load Balancer)

          Schedulers[c][4] => LoadBalancer[c];  // SchedLoad
	  LoadBalancer[2 + c] => Schedulers[c][5]; // Ack for SchedLoad

          // Connections for the Task Record Network
          // To the Task Record Network from Core Schedulers
          Schedulers[c][2]             =>   BalancingNetwork[c]; // TaskRecord
          BalancingNetwork[c+2]  =>   Schedulers[c][2];       // Acknowledgement

          // Connect Cores to CoreSchedulers RESUME ports
          Cores[c][6] => Schedulers[c][4]; // RESUME command

          // To the Core Schedulers from the Task Record Network
          BalancingNetwork[c]  =>   Schedulers[c][3];         // TaskRecord
          Schedulers[c][3]     =>   BalancingNetwork[c+2]; // Acknowledgement

          // The BalancingStop signal from the cores to the LoadBalancer
          Cores[c][5] => LoadBalancer[twoTimesNumberOfProcessingUnits + 2];

	  // Memory continue links
	  MemUnits[c][2] => MemUnits[c][2]; // MemoryContinueDataItem

          // Connect the processors to the inputs of the forward 2x2 (processors to memory units, stage 0 or input stage)
          Cores[c][0]         => P2MNetwork[c];  // Data
          P2MNetwork[c+2]  => Cores[c][4];    // Ack

          // Connect the outputs of the forwared 2x2 (processors to memory units, stage 2 or output stage) to the memory units
          P2MNetwork[c]   => MemUnits[c][0];     // Data
          MemUnits[c][0]  => P2MNetwork[c+2]; // Ack

          // Connect the memory units to the inputs of the reverse 2x2 (memory units to processors, stage 0 or input stage)
          MemUnits[c][1]     => M2PNetwork[c];  // Data
          M2PNetwork[c+2] => MemUnits[c][1]; // Ack

          // Connect the outputs of the reverse 2x2 (memory units to processors, stage 2 or output stage) to the processors' inputs
          M2PNetwork[c]  => Cores[c][0];        // Data
          Cores[c][4]    => M2PNetwork[c+2]; // Ack

      }

   } // end of connections

} // end systemtwo SysTwo2x2DotProduct

