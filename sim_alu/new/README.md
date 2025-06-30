# 2-bit ALU with Arithmetic and Logical Operations

This project implements a **2-bit Arithmetic and Logic Unit (ALU)** in **Verilog**, capable of performing 8 operations (4 arithmetic, 4 logical) with a **3-bit control input**. It includes a testbench to verify functionality for all operations.

---

##  Files

- `AGV_dig_task.v` – Main ALU module implementing logic and arithmetic operations  
- `tb_AGV_dig.v` – Testbench to validate ALU behavior across all supported operations  
- `adder4.v` and `multiplier2x2.v` – Required helper modules for 4-bit addition and 2x2-bit multiplication (assumed to be present)

---

## 🔌 Inputs and Outputs

### Inputs

| Signal | Width | Description                           |
|--------|--------|---------------------------------------|
| `A`    | 2 bits | First operand                         |
| `B`    | 2 bits | Second operand                        |
| `Cin`  | 1 bit  | Carry-in for addition                 |
| `S`    | 3 bits | Operation selector                    |

### Outputs

| Signal | Width | Description                           |
|--------|--------|---------------------------------------|
| `Y`    | 4 bits | Output of selected ALU operation      |

---

## 🔧 Operations (Controlled by `S` Input)

| `S` Value | Operation       | Description                             |
|-----------|------------------|-----------------------------------------|
| `000`     | Bitwise AND      | Bitwise AND on A and B                  |
| `001`     | Bitwise OR       | Bitwise OR on A and B                   |
| `010`     | Bitwise XOR      | Bitwise XOR on A and B                  |
| `011`     | Bitwise NOT      | Bitwise NOT of A                        |
| `100`     | Addition          | A + B + Cin                             |
| `101`     | Subtraction       | A - B + Cin (2’s complement logic)      |
| `110`     | Multiplication    | A × B using 2x2 multiplier              |
| `111`     | Compare A > B     | Outputs 1 if A > B, else 0              |

> Note: MSB of `S` determines operation type —  
> `0` → Logical, `1` → Arithmetic

---

## 🧪 Testbench Details

The testbench (`tb_AGV_dig.v`) performs a simple sequence of tests:

- Initializes inputs and cycles through all 8 operations
- Displays results using `$monitor` with values of `A`, `B`, `Cin`, `S`, and `Y`

