# Energy-Efficient RISC-V Matrix Multiplication Accelerator for Edge AI Inference

## Project Overview
This project implements a RISC-V-based matrix multiplication (GEMM) accelerator optimized for edge AI inference workloads. The accelerator features pipelined int8/int16 MAC arrays, double-buffered scratchpad SRAM, and lightweight DMA engine for efficient data movement.

## Project Timeline (October-November 2024)

### Week 1 (October 1-7): Project Setup & Architecture Design
- [x] Project structure setup
- [x] Architecture specification document
- [x] Interface design (RISC-V custom instruction + memory-mapped registers)
- [x] Dataflow design (MxK×KxN blocking strategy)

### Week 2 (October 8-14): RTL Implementation - Core Components
- [x] MAC array implementation (int8/int16 support)
- [ ] Scratchpad SRAM with double buffering
- [ ] DMA engine for data movement
- [ ] Basic control logic and state machine

### Week 3 (October 15-21): RTL Implementation - Integration & Interface
- [ ] RISC-V custom instruction interface
- [ ] Memory-mapped register file
- [ ] Pipeline integration and timing closure
- [ ] Basic functional verification

### Week 4 (October 22-28): Verification & Testing
- [ ] Comprehensive testbench development
- [ ] Unit tests for all components
- [ ] Integration tests
- [ ] Software oracle implementation for verification

### Week 5 (October 29-November 4): Software Integration
- [ ] C driver implementation
- [ ] TensorFlow Lite Micro integration
- [ ] Kernel routing for fully-connected and conv-as-GEMM
- [ ] End-to-end software testing

### Week 6 (November 5-11): FPGA Implementation & Benchmarking
- [ ] FPGA synthesis and implementation
- [ ] Timing analysis and optimization
- [ ] Power measurement setup
- [ ] MNIST/CIFAR-10/keyword-spotting model deployment

### Week 7 (November 12-18): Performance Analysis & Documentation
- [ ] Performance benchmarking (latency, throughput, GOPS)
- [ ] Resource utilization analysis
- [ ] Power consumption measurements
- [ ] Roofline analysis (compute vs bandwidth)

### Week 8 (November 19-25): Final Integration & Report
- [ ] Final system integration
- [ ] Complete documentation
- [ ] Performance comparison with baseline RISC-V software
- [ ] Project report preparation

## Project Structure

```
BTECH-PROJECT/
├── README.md                           # This file
├── docs/                               # Documentation
│   └── architecture.md                 # Detailed architecture specification
├── rtl/                                # RTL Implementation
│   └── mac_array/                     # MAC array implementation ✅ IMPLEMENTED
│       └── mac_array.v                # 8x8 MAC array with int8/int16 support
├── [TO BE IMPLEMENTED]                 # Future components
│   ├── rtl/
│   │   ├── scratchpad/                # Scratchpad SRAM with double buffering
│   │   ├── dma/                       # DMA engine
│   │   ├── interface/                 # RISC-V interface
│   │   └── top/                       # Top-level integration
│   ├── testbench/                     # Verification testbenches
│   ├── software/                      # Software stack
│   ├── fpga/                          # FPGA implementation
│   ├── models/                        # AI models for testing
│   └── results/                       # Results and analysis
```

## Implementation Status

### ✅ Currently Implemented
- **MAC Array Module** (`rtl/mac_array/mac_array.v`)
  - 8x8 array of multiply-accumulate units
  - Support for int8 and int16 data types
  - 32-bit accumulation with saturation
  - 3-stage pipeline implementation
  - Individual MAC units with configurable data width

### 🚧 To Be Implemented
- Scratchpad SRAM with double buffering
- DMA engine for data movement
- RISC-V custom instruction interface
- Memory-mapped register file
- Top-level integration and control logic
- Verification testbenches
- Software stack and drivers
- FPGA implementation and benchmarking

### Hardware Components
- **MAC Array**: Pipelined int8/int16 multiply-accumulate units
- **Scratchpad SRAM**: Double-buffered memory for efficient data access
- **DMA Engine**: Lightweight data movement controller
- **RISC-V Interface**: Custom instruction and memory-mapped registers

### Software Stack
- **C Driver**: Low-level hardware interface
- **TensorFlow Lite Micro Integration**: Seamless AI model deployment
- **Kernel Routing**: Automatic GEMM kernel offloading

### Target Applications
- MNIST digit recognition
- CIFAR-10 image classification
- Keyword spotting for voice commands

## Performance Targets
- Multi-× speedup over baseline RISC-V software GEMM
- Improved energy efficiency per inference
- Support for quantized int8 inference
- Real-time performance on edge devices

## Getting Started

### Current Implementation
The project currently contains only the MAC array RTL implementation. To work with the current code:

1. **Review Architecture**: Read `docs/architecture.md` for detailed specifications
2. **Examine MAC Array**: Review `rtl/mac_array/mac_array.v` for the implemented MAC array module
3. **Simulation Setup**: Use a Verilog simulator to test the MAC array functionality

### Future Development
Once additional components are implemented:
1. **Setup Environment**: Install required tools (Verilog simulator, FPGA tools, TensorFlow Lite Micro)
2. **Run Verification**: Execute testbenches in `testbench/` directory
3. **Deploy Models**: Use models in `models/` directory for end-to-end testing

## Dependencies
- Verilog simulator (ModelSim/QuestaSim or open-source alternatives)
- FPGA synthesis tools (Vivado/Quartus)
- TensorFlow Lite Micro framework
- RISC-V toolchain
- Python for benchmarking and analysis

## Contributing
This is a final year BTech project. All development follows the timeline outlined above.

## License
Academic project - see project guidelines for usage rights.
