// Description file template used for generating a 8 by 8 target system.
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

systemtwo SysTwo8x8DotProduct {

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

   // A column of 4 2x2 Command routers - 16 input and 16 output data ports
   module CommandRouterColumn (16, 16)
      nodes {
         // Ensemble of 2x2 CommandRouters
         ensemble CommandRouters (4, module, CommandRouter);
         } // End nodes
      connections {
         for (0 .. 7) => p {
            set p + 8 => ackPortNumber;
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
   module CommandNetwork (16, 16)
      nodes {
        ensemble CommandRouterStages (3, module, CommandRouterColumn);
      } // end of node declarations
      // Connections
      connections {
         input[0] => CommandRouterStages[0][0]; // Data
         CommandRouterStages[0][8] => output[8]; // Ack
         CommandRouterStages[2][0] => output[0]; // Data
         input[8] => CommandRouterStages[2][8];  // Ack
         input[1] => CommandRouterStages[0][1]; // Data
         CommandRouterStages[0][9] => output[9]; // Ack
         CommandRouterStages[2][1] => output[1]; // Data
         input[9] => CommandRouterStages[2][9];  // Ack
         input[2] => CommandRouterStages[0][2]; // Data
         CommandRouterStages[0][10] => output[10]; // Ack
         CommandRouterStages[2][2] => output[2]; // Data
         input[10] => CommandRouterStages[2][10];  // Ack
         input[3] => CommandRouterStages[0][3]; // Data
         CommandRouterStages[0][11] => output[11]; // Ack
         CommandRouterStages[2][3] => output[3]; // Data
         input[11] => CommandRouterStages[2][11];  // Ack
         input[4] => CommandRouterStages[0][4]; // Data
         CommandRouterStages[0][12] => output[12]; // Ack
         CommandRouterStages[2][4] => output[4]; // Data
         input[12] => CommandRouterStages[2][12];  // Ack
         input[5] => CommandRouterStages[0][5]; // Data
         CommandRouterStages[0][13] => output[13]; // Ack
         CommandRouterStages[2][5] => output[5]; // Data
         input[13] => CommandRouterStages[2][13];  // Ack
         input[6] => CommandRouterStages[0][6]; // Data
         CommandRouterStages[0][14] => output[14]; // Ack
         CommandRouterStages[2][6] => output[6]; // Data
         input[14] => CommandRouterStages[2][14];  // Ack
         input[7] => CommandRouterStages[0][7]; // Data
         CommandRouterStages[0][15] => output[15]; // Ack
         CommandRouterStages[2][7] => output[7]; // Data
         input[15] => CommandRouterStages[2][15];  // Ack
         CommandRouterStages[0][0] => CommandRouterStages[1][0];
         CommandRouterStages[1][8] => CommandRouterStages[0][8];
         CommandRouterStages[0][1] => CommandRouterStages[1][4];
         CommandRouterStages[1][12] => CommandRouterStages[0][9];
         CommandRouterStages[0][2] => CommandRouterStages[1][1];
         CommandRouterStages[1][9] => CommandRouterStages[0][10];
         CommandRouterStages[0][3] => CommandRouterStages[1][5];
         CommandRouterStages[1][13] => CommandRouterStages[0][11];
         CommandRouterStages[0][4] => CommandRouterStages[1][2];
         CommandRouterStages[1][10] => CommandRouterStages[0][12];
         CommandRouterStages[0][5] => CommandRouterStages[1][6];
         CommandRouterStages[1][14] => CommandRouterStages[0][13];
         CommandRouterStages[0][6] => CommandRouterStages[1][3];
         CommandRouterStages[1][11] => CommandRouterStages[0][14];
         CommandRouterStages[0][7] => CommandRouterStages[1][7];
         CommandRouterStages[1][15] => CommandRouterStages[0][15];
         CommandRouterStages[1][0] => CommandRouterStages[2][0];
         CommandRouterStages[2][8] => CommandRouterStages[1][8];
         CommandRouterStages[1][1] => CommandRouterStages[2][2];
         CommandRouterStages[2][10] => CommandRouterStages[1][9];
         CommandRouterStages[1][2] => CommandRouterStages[2][1];
         CommandRouterStages[2][9] => CommandRouterStages[1][10];
         CommandRouterStages[1][3] => CommandRouterStages[2][3];
         CommandRouterStages[2][11] => CommandRouterStages[1][11];
         CommandRouterStages[1][4] => CommandRouterStages[2][4];
         CommandRouterStages[2][12] => CommandRouterStages[1][12];
         CommandRouterStages[1][5] => CommandRouterStages[2][6];
         CommandRouterStages[2][14] => CommandRouterStages[1][13];
         CommandRouterStages[1][6] => CommandRouterStages[2][5];
         CommandRouterStages[2][13] => CommandRouterStages[1][14];
         CommandRouterStages[1][7] => CommandRouterStages[2][7];
         CommandRouterStages[2][15] => CommandRouterStages[1][15];
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

   // A column of 4 2x2 Response routers - 16 input and 16 output data ports
   module ResponseRouterColumn (16, 16)
      nodes {
         // Ensemble of 2x2 ResponseRouters
         ensemble ResponseRouters (4, module, ResponseRouter);
         } // End nodes
      connections {
         for (0 .. 7) => p {
            set p + 8 => ackPortNumber;
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
   module ResponseNetwork (16, 16)
      nodes {
        ensemble ResponseRouterStages (3, module, ResponseRouterColumn);
      } // end of node declarations
      // Connections
      connections {
         input[0] => ResponseRouterStages[0][0]; // Data
         ResponseRouterStages[0][8] => output[8]; // Ack
         ResponseRouterStages[2][0] => output[0]; // Data
         input[8] => ResponseRouterStages[2][8];  // Ack
         input[1] => ResponseRouterStages[0][1]; // Data
         ResponseRouterStages[0][9] => output[9]; // Ack
         ResponseRouterStages[2][1] => output[1]; // Data
         input[9] => ResponseRouterStages[2][9];  // Ack
         input[2] => ResponseRouterStages[0][2]; // Data
         ResponseRouterStages[0][10] => output[10]; // Ack
         ResponseRouterStages[2][2] => output[2]; // Data
         input[10] => ResponseRouterStages[2][10];  // Ack
         input[3] => ResponseRouterStages[0][3]; // Data
         ResponseRouterStages[0][11] => output[11]; // Ack
         ResponseRouterStages[2][3] => output[3]; // Data
         input[11] => ResponseRouterStages[2][11];  // Ack
         input[4] => ResponseRouterStages[0][4]; // Data
         ResponseRouterStages[0][12] => output[12]; // Ack
         ResponseRouterStages[2][4] => output[4]; // Data
         input[12] => ResponseRouterStages[2][12];  // Ack
         input[5] => ResponseRouterStages[0][5]; // Data
         ResponseRouterStages[0][13] => output[13]; // Ack
         ResponseRouterStages[2][5] => output[5]; // Data
         input[13] => ResponseRouterStages[2][13];  // Ack
         input[6] => ResponseRouterStages[0][6]; // Data
         ResponseRouterStages[0][14] => output[14]; // Ack
         ResponseRouterStages[2][6] => output[6]; // Data
         input[14] => ResponseRouterStages[2][14];  // Ack
         input[7] => ResponseRouterStages[0][7]; // Data
         ResponseRouterStages[0][15] => output[15]; // Ack
         ResponseRouterStages[2][7] => output[7]; // Data
         input[15] => ResponseRouterStages[2][15];  // Ack
         ResponseRouterStages[0][0] => ResponseRouterStages[1][0];
         ResponseRouterStages[1][8] => ResponseRouterStages[0][8];
         ResponseRouterStages[0][1] => ResponseRouterStages[1][4];
         ResponseRouterStages[1][12] => ResponseRouterStages[0][9];
         ResponseRouterStages[0][2] => ResponseRouterStages[1][1];
         ResponseRouterStages[1][9] => ResponseRouterStages[0][10];
         ResponseRouterStages[0][3] => ResponseRouterStages[1][5];
         ResponseRouterStages[1][13] => ResponseRouterStages[0][11];
         ResponseRouterStages[0][4] => ResponseRouterStages[1][2];
         ResponseRouterStages[1][10] => ResponseRouterStages[0][12];
         ResponseRouterStages[0][5] => ResponseRouterStages[1][6];
         ResponseRouterStages[1][14] => ResponseRouterStages[0][13];
         ResponseRouterStages[0][6] => ResponseRouterStages[1][3];
         ResponseRouterStages[1][11] => ResponseRouterStages[0][14];
         ResponseRouterStages[0][7] => ResponseRouterStages[1][7];
         ResponseRouterStages[1][15] => ResponseRouterStages[0][15];
         ResponseRouterStages[1][0] => ResponseRouterStages[2][0];
         ResponseRouterStages[2][8] => ResponseRouterStages[1][8];
         ResponseRouterStages[1][1] => ResponseRouterStages[2][2];
         ResponseRouterStages[2][10] => ResponseRouterStages[1][9];
         ResponseRouterStages[1][2] => ResponseRouterStages[2][1];
         ResponseRouterStages[2][9] => ResponseRouterStages[1][10];
         ResponseRouterStages[1][3] => ResponseRouterStages[2][3];
         ResponseRouterStages[2][11] => ResponseRouterStages[1][11];
         ResponseRouterStages[1][4] => ResponseRouterStages[2][4];
         ResponseRouterStages[2][12] => ResponseRouterStages[1][12];
         ResponseRouterStages[1][5] => ResponseRouterStages[2][6];
         ResponseRouterStages[2][14] => ResponseRouterStages[1][13];
         ResponseRouterStages[1][6] => ResponseRouterStages[2][5];
         ResponseRouterStages[2][13] => ResponseRouterStages[1][14];
         ResponseRouterStages[1][7] => ResponseRouterStages[2][7];
         ResponseRouterStages[2][15] => ResponseRouterStages[1][15];
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

   // A column of 4 2x2 TaskRecord routers - 16 input and 16 output data ports
   module TaskRecordRouterColumn (16, 16)
      nodes {
         // Ensemble of 2x2 TaskRecordRouters
         ensemble TaskRecordRouters (4, module, TaskRecordRouter);
         } // End nodes
      connections {
         for (0 .. 7) => p {
            set p + 8 => ackPortNumber;
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
   module TaskRecordNetwork (16, 16)
      nodes {
        ensemble TaskRecordRouterStages (3, module, TaskRecordRouterColumn);
      } // end of node declarations
      // Connections
      connections {
         input[0] => TaskRecordRouterStages[0][0]; // Data
         TaskRecordRouterStages[0][8] => output[8]; // Ack
         TaskRecordRouterStages[2][0] => output[0]; // Data
         input[8] => TaskRecordRouterStages[2][8];  // Ack
         input[1] => TaskRecordRouterStages[0][1]; // Data
         TaskRecordRouterStages[0][9] => output[9]; // Ack
         TaskRecordRouterStages[2][1] => output[1]; // Data
         input[9] => TaskRecordRouterStages[2][9];  // Ack
         input[2] => TaskRecordRouterStages[0][2]; // Data
         TaskRecordRouterStages[0][10] => output[10]; // Ack
         TaskRecordRouterStages[2][2] => output[2]; // Data
         input[10] => TaskRecordRouterStages[2][10];  // Ack
         input[3] => TaskRecordRouterStages[0][3]; // Data
         TaskRecordRouterStages[0][11] => output[11]; // Ack
         TaskRecordRouterStages[2][3] => output[3]; // Data
         input[11] => TaskRecordRouterStages[2][11];  // Ack
         input[4] => TaskRecordRouterStages[0][4]; // Data
         TaskRecordRouterStages[0][12] => output[12]; // Ack
         TaskRecordRouterStages[2][4] => output[4]; // Data
         input[12] => TaskRecordRouterStages[2][12];  // Ack
         input[5] => TaskRecordRouterStages[0][5]; // Data
         TaskRecordRouterStages[0][13] => output[13]; // Ack
         TaskRecordRouterStages[2][5] => output[5]; // Data
         input[13] => TaskRecordRouterStages[2][13];  // Ack
         input[6] => TaskRecordRouterStages[0][6]; // Data
         TaskRecordRouterStages[0][14] => output[14]; // Ack
         TaskRecordRouterStages[2][6] => output[6]; // Data
         input[14] => TaskRecordRouterStages[2][14];  // Ack
         input[7] => TaskRecordRouterStages[0][7]; // Data
         TaskRecordRouterStages[0][15] => output[15]; // Ack
         TaskRecordRouterStages[2][7] => output[7]; // Data
         input[15] => TaskRecordRouterStages[2][15];  // Ack
         TaskRecordRouterStages[0][0] => TaskRecordRouterStages[1][0];
         TaskRecordRouterStages[1][8] => TaskRecordRouterStages[0][8];
         TaskRecordRouterStages[0][1] => TaskRecordRouterStages[1][4];
         TaskRecordRouterStages[1][12] => TaskRecordRouterStages[0][9];
         TaskRecordRouterStages[0][2] => TaskRecordRouterStages[1][1];
         TaskRecordRouterStages[1][9] => TaskRecordRouterStages[0][10];
         TaskRecordRouterStages[0][3] => TaskRecordRouterStages[1][5];
         TaskRecordRouterStages[1][13] => TaskRecordRouterStages[0][11];
         TaskRecordRouterStages[0][4] => TaskRecordRouterStages[1][2];
         TaskRecordRouterStages[1][10] => TaskRecordRouterStages[0][12];
         TaskRecordRouterStages[0][5] => TaskRecordRouterStages[1][6];
         TaskRecordRouterStages[1][14] => TaskRecordRouterStages[0][13];
         TaskRecordRouterStages[0][6] => TaskRecordRouterStages[1][3];
         TaskRecordRouterStages[1][11] => TaskRecordRouterStages[0][14];
         TaskRecordRouterStages[0][7] => TaskRecordRouterStages[1][7];
         TaskRecordRouterStages[1][15] => TaskRecordRouterStages[0][15];
         TaskRecordRouterStages[1][0] => TaskRecordRouterStages[2][0];
         TaskRecordRouterStages[2][8] => TaskRecordRouterStages[1][8];
         TaskRecordRouterStages[1][1] => TaskRecordRouterStages[2][2];
         TaskRecordRouterStages[2][10] => TaskRecordRouterStages[1][9];
         TaskRecordRouterStages[1][2] => TaskRecordRouterStages[2][1];
         TaskRecordRouterStages[2][9] => TaskRecordRouterStages[1][10];
         TaskRecordRouterStages[1][3] => TaskRecordRouterStages[2][3];
         TaskRecordRouterStages[2][11] => TaskRecordRouterStages[1][11];
         TaskRecordRouterStages[1][4] => TaskRecordRouterStages[2][4];
         TaskRecordRouterStages[2][12] => TaskRecordRouterStages[1][12];
         TaskRecordRouterStages[1][5] => TaskRecordRouterStages[2][6];
         TaskRecordRouterStages[2][14] => TaskRecordRouterStages[1][13];
         TaskRecordRouterStages[1][6] => TaskRecordRouterStages[2][5];
         TaskRecordRouterStages[2][13] => TaskRecordRouterStages[1][14];
         TaskRecordRouterStages[1][7] => TaskRecordRouterStages[2][7];
         TaskRecordRouterStages[2][15] => TaskRecordRouterStages[1][15];
      } // end connections
   } // end TaskRecordNetwork module definition


   end;
   } nodes {

   // Node Declarations (Component Instances) (componentClass, optional_coreIndex)
   component Start (SysTwoStart);
   component Initializer (SysTwoInitializer, 0, 8, 8); // set dummy coreidx to 0, input/ouput data port count to size);

   // 8 (= size) Processing Units
   ensemble Cores (8, component, SysTwoProcessingUnit);  // (number of components, component or module, className, optional-coreIndex)
   ensemble Schedulers (8, component, SysTwoCoreSched);
   component LoadBalancer (SysTwoLoadBalancer, 0, 8, 8); // set dummy coreidx to 0, input/ouput data port count to size);


   // 3 columns of 8 2x2 routers, one for each stage of the routing network

   // Processing units to memory units (memory commands) direction 8x8 (3 stages of 8 2x2 routers)
   module P2MNetwork (CommandNetwork);

   // Memory units to processing units (memory responses) direction 8x8 (3 stages of 8 2x2 routers)
   module M2PNetwork (ResponseNetwork);

   // TaskRecordNetwork: interconnecting the core schedulers
   module BalancingNetwork(TaskRecordNetwork);

   // 8 (= size) Memory Banks
   ensemble MemUnits (8, component, SysTwoMemUnit);

   } // end of node specifications


   // Connections
   connections {

      set 2 * 8 => twoTimesNumberOfProcessingUnits;

      // Processing Units

      Start[0] => Initializer[0];       // StartSim

      // Connection to initiate load balancing from Start (shared with LB continue port)
      Start[1]  => LoadBalancer[twoTimesNumberOfProcessingUnits];

      // Connection to stop load balancing from the Initializer
//      Initializer[8]  => LoadBalancer[twoTimesNumberOfProcessingUnits + 1]; // BalancerStop
      Initializer[8]  => LoadBalancer[twoTimesNumberOfProcessingUnits + 1]; // BalancerStop

      // Connection to continue load balancing
      LoadBalancer[ twoTimesNumberOfProcessingUnits]  => LoadBalancer[twoTimesNumberOfProcessingUnits];

      for (0 .. 8 - 1) => c {
          Initializer[c] => Cores[c][3];     // SimInit, StartSim
          Cores[c][3]  => Initializer[c];    // InitDone

          Schedulers[c][0] => Cores[c][1]; // SchedDataItem

          Cores[c][1] => Schedulers[c][0]; // SchedDataItem
          Cores[c][2] => Cores[c][2];      // ProcDataItem

          // Connect the LoadBalancer to the CoreSchedulers
          LoadBalancer[c]    => Schedulers[c][1];  // SchedTake
//          Schedulers[c][1] => LoadBalancer[8 + 1];  // SendToAck
          Schedulers[c][1] => LoadBalancer[8 + c];  // SendToAck (ack for SchedTake received from Load Balancer)

          Schedulers[c][4] => LoadBalancer[c];  // SchedLoad
	  LoadBalancer[8 + c] => Schedulers[c][5]; // Ack for SchedLoad

          // Connections for the Task Record Network
          // To the Task Record Network from Core Schedulers
          Schedulers[c][2]             =>   BalancingNetwork[c]; // TaskRecord
          BalancingNetwork[c+8]  =>   Schedulers[c][2];       // Acknowledgement

          // Connect Cores to CoreSchedulers RESUME ports
          Cores[c][6] => Schedulers[c][4]; // RESUME command

          // To the Core Schedulers from the Task Record Network
          BalancingNetwork[c]  =>   Schedulers[c][3];         // TaskRecord
          Schedulers[c][3]     =>   BalancingNetwork[c+8]; // Acknowledgement

          // The BalancingStop signal from the cores to the LoadBalancer
          Cores[c][5] => LoadBalancer[twoTimesNumberOfProcessingUnits + 2];

	  // Memory continue links
	  MemUnits[c][2] => MemUnits[c][2]; // MemoryContinueDataItem

          // Connect the processors to the inputs of the forward 8x8 (processors to memory units, stage 0 or input stage)
          Cores[c][0]         => P2MNetwork[c];  // Data
          P2MNetwork[c+8]  => Cores[c][4];    // Ack

          // Connect the outputs of the forwared 8x8 (processors to memory units, stage 2 or output stage) to the memory units
          P2MNetwork[c]   => MemUnits[c][0];     // Data
          MemUnits[c][0]  => P2MNetwork[c+8]; // Ack

          // Connect the memory units to the inputs of the reverse 8x8 (memory units to processors, stage 0 or input stage)
          MemUnits[c][1]     => M2PNetwork[c];  // Data
          M2PNetwork[c+8] => MemUnits[c][1]; // Ack

          // Connect the outputs of the reverse 8x8 (memory units to processors, stage 2 or output stage) to the processors' inputs
          M2PNetwork[c]  => Cores[c][0];        // Data
          Cores[c][4]    => M2PNetwork[c+8]; // Ack

      }

   } // end of connections

} // end systemtwo SysTwo8x8DotProduct

