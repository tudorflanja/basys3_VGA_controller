# 🎨 Basys3 VGA Controller — FPGA Shape Display System

This project implements a **VGA controller on the Basys 3 FPGA board** using **VHDL** in Vivado.  
It can **display and move geometric shapes** (square, line, triangle, circle) in **four selectable colors** on a VGA monitor.  

Users control **shape selection**, **color**, and **position** directly from the **Basys 3 buttons and switches**.

---

## 🏠 Overview

The VGA controller generates the required **horizontal and vertical synchronization signals** to drive a standard 640×480 VGA display.  
It divides the onboard 100 MHz Basys3 clock down to 25 MHz, computes pixel positions, and determines which pixels to light based on the active shape and its position.

The user can:
- Change the displayed **shape** via board switches  
- Select one of **four colors**  
- Move the figure across the screen using **directional buttons**

---

## ⚙️ Core Features

- 🧭 **Shape Rendering**
  - Displays **square**, **vertical line**, **triangle**, or **circle**
  - Position is dynamically updated with on-board push buttons  

- 🎨 **Color Selection**
  - 4 colors available: **Red**, **Green**, **Blue**, and **White**  
  - Selected using 2 input switches  

- ⏱️ **Accurate VGA Timing**
  - 640 × 480 @ 60 Hz  
  - Horizontal & vertical sync signals generated precisely using counters and comparators  

- 🔄 **Dynamic Control**
  - Real-time movement in both X and Y directions  
  - Reset button clears the display  

---

## 🧠 How It Works

The project consists of several logical components implemented in a single **VHDL module (`vgaDriver.vhd`)**:

| Component | Description |
|------------|--------------|
| **Clock Divider 1** | Divides 100 MHz to 50 MHz |
| **Clock Divider 2** | Divides 50 MHz to 25 MHz pixel clock |
| **Horizontal Counter** | Counts pixels per row (0–799) |
| **Vertical Counter** | Counts rows per frame (0–524) |
| **Comparators** | Generate HSync, VSync, and video signals |
| **4:1 MUX** | Selects one of four colors |
| **Draw Logic** | Determines pixel coloring based on shape type and coordinates |

The controller uses two nested counters to generate synchronization pulses and pixel coordinates.  
Based on these coordinates, the active area is filled according to the chosen shape and color.  

---

## 🧩 Inputs and Outputs

| Type | Signal | Description |
|------|---------|-------------|
| **Input** | `clk` | 100 MHz Basys3 clock |
| **Input** | `rst` | Reset display |
| **Input** | `up`, `down`, `left`, `right` | Move figure position |
| **Input** | `shape(1:0)` | Select shape: `00`=square, `01`=line, `10`=triangle, `11`=circle |
| **Input** | `color(1:0)` | Select color: `00`=red, `01`=green, `10`=blue, `11`=white |
| **Output** | `r, g, b` | VGA color outputs |
| **Output** | `hsync`, `vsync` | VGA synchronization signals |

---

## 🧮 Timing Parameters

| Parameter | Symbol | Value | Description |
|------------|---------|--------|-------------|
| Horizontal Display | `hd` | 640 | Visible area |
| Front Porch | `hfp` | 16 | Right margin |
| Sync Pulse | `hsp` | 96 | Retrace signal |
| Back Porch | `hbp` | 48 | Left margin |
| Vertical Display | `vd` | 480 | Visible area |
| Front Porch | `vfp` | 10 | Bottom margin |
| Sync Pulse | `vsp` | 2 | Retrace signal |
| Back Porch | `vbp` | 33 | Top margin |

The 25 MHz pixel clock ensures a frame rate of **60 Hz**, providing a stable display.

---

## 📁 Files in This Repository

| File | Description |
|------|--------------|
| `src/vgaDriver.vhd` | Main VHDL source file containing the full VGA controller logic |
| `constraints/vgaDriver.xdc` | Basys3 constraint file with pin mappings (buttons, switches, VGA) |
| `.gitignore` | Excludes Vivado build and temporary files |
| `README.md` | Project documentation |

---

## 🖥️ Running the Project

### 1. **Set up Vivado**
- Open **Xilinx Vivado** and create a new project targeting **Basys 3 (xc7a35t-cpg236-1)**  
- Set **language** to *VHDL*  
- Import the following:
  - `vgaDriver.vhd` → as **Design Source**
  - `vgaDriver.xdc` → as **Constraints**

### 2. **Synthesize & Implement**
- Run **Synthesis → Implementation → Generate Bitstream**  
- Connect the **Basys 3 board** via USB  
- Click **Program Device**

### 3. **Test It**
- Connect a **VGA monitor**  
- Use board switches to change **shape** and **color**  
- Move the figure using **buttons** (Up, Down, Left, Right)  
- Press **Reset** to clear display  

---

## 🧰 Technologies Used

- **Vivado Design Suite (Xilinx)**
- **VHDL (IEEE STD_LOGIC)**  
- **Basys 3 Artix-7 FPGA Board**  
- **VGA 640×480 Display Standard**

---

## 🧩 Example Control Mapping (Basys3)

| Control | Basys3 Element | Function |
|----------|----------------|-----------|
| `BTNU` | Up | Move up |
| `BTND` | Down | Move down |
| `BTNL` | Left | Move left |
| `BTNR` | Right | Move right |
| `BTNC` | Reset |
| `SW0–SW1` | Shape selection |
| `SW2–SW3` | Color selection |
| `VGA Port` | Output to monitor |

---

## 🧪 Possible Extensions

- 🕹️ Add joystick or keyboard input  
- 🧮 Implement ROM for complex sprites or images  
- 📈 Support higher resolutions (800×600, 1024×768)  
- 🧠 Integrate dynamic animations or text overlays  

---

## 📝 Conclusion

The **Basys3 VGA Controller** demonstrates how an FPGA can generate synchronized video output using pure VHDL logic.  
It integrates **timing control**, **color multiplexing**, and **interactive movement** into a compact digital design — ideal for learning FPGA display systems.
