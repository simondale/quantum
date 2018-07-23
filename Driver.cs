using System;
using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Rand
{
    /// <summary>
    /// This is the C# driver application that will host the Quantum Simulator
    /// and manage interactions between C# code and Q# code.
    /// </summary>
    internal sealed class Driver
    {
        /// <summary>
        /// The program entry point
        /// </summary>
        /// <param name="args">The command line arguments</param>
        private static void Main(string[] args)
        {
            // create the quantum simulator
            using (var sim = new QuantumSimulator())
            {
                // call the quantum operation and pass the simulator and arguments
                // then capture the results so these can be written to the console
                var result = Random.Run(sim, 10).Result;

                // display the results
                Console.WriteLine($"Random: {result}");
            }
        }
    }
}