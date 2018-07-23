namespace Rand
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Primitive;

    /// <summary>
    /// An operation that generates an even distribution
    /// of values either 0 or 1
    /// </summary>
    operation Random (count : Int) : (Int[])
    {
        body
        {
            // declare an array to hold the results
            mutable results = new Int[count];

            // assign the qubits to hold quantum state
            using (qubits = Qubit[1])
            {
                for (i in 1..count)
                {
                    // set the state of the qubit to either 0 or 1 with H() gate
                    // then measure with M(). If the value is One then set the
                    // qubit to Zero so the qubit can be safely released. also
                    // record the measured value to the results array
                    H(qubits[0]);
                    let r = M(qubits[0]);
                    if (r == One)
                    {
                        set results[i-1] = 1;
                        X(qubits[0]);
                    }
                    else
                    {
                        set results[i-1] = 0;
                    }
                }
            }

            return results;
        }
    }
}
