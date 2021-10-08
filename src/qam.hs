import Data.Complex (Complex)
import Data.Bits (FiniteBits)

type Qubit = (Complex Float, Complex Float)
type Qregister = [Qubit]
type CRegister = FiniteBits Int 
type PC = Int
type QGateStatic = Int
type QGateParametric = Int
type QGates = ([QGateStatic], [QGateParametric])
data ClassicalInstruction = CNot (Int) | CTrue (Int) | CFalse (Int) | CAnd (Int Int Int) | COr (Int Int Int) | CExchange (Int Int) | CMove (Int Int) 
    deriving (Enum, Read, Show)
data QuilInstruction = QNoop | ClassicalInstruction | Wait
type Program = [QuilInstruction]
type QAM = (Qregister, CRegister, QGates, Program, PC)

executeStep:: QAM -> QAM
executeStep p = p