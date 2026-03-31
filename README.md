# pid-spacecraft-rendezvous-control

**Overview:**
This repository presents the implementation of a PID-based control framework for autonomous spacecraft rendezvous, focusing on translational motion tracking of a chaser spacecraft relative to a target. The system integrates classical control design with metaheuristic optimisation techniques to enhance tracking performance.

🎯 **Objectives:**
* Develop a PID-based control architecture for spacecraft rendezvous
* Achieve accurate position and velocity tracking
* Compare manually tuned and optimised controller gains
* Evaluate performance of metaheuristic optimisation algorithms

⚙️ **Methodology:**

🔹 Relative Dynamics:
The relative motion is modelled using the Clohessy–Wiltshire (CW) equations, enabling linearised representation of spacecraft motion in orbit.

🔹 Control Architecture:
A two-tier PID-based control framework is implemented:
Outer loop: Trajectory generation
Inner loop: Force-based tracking control

The system is developed using the MATLAB/Simulink Spacecraft Dynamics block.

🚀 **Optimisation Techniques:**
The following algorithms are used for PID gain tuning:
* Particle Swarm Optimization (PSO)
* Grey Wolf Optimizer (GWO)
* Ant Lion Optimizer (ALO)
* Whale Optimization Algorithm (WOA)
  
📊 **Results & Insights:**
* PSO serves as a strong baseline due to low computational cost
* GWO achieves a balance between tracking accuracy and processing time
* ALO improves tracking performance at the cost of higher computation time

📌 **Note:** Plots included in this repository represent position and velocity tracking along the X-axis for reference.

🛠️ **Tools & Technologies:**
* MATLAB / Simulink
* Spacecraft Dynamics Block
* Control Systems (PID)
* Metaheuristic Optimization
  
🔮 **Future Work:**
* Integration of full 6-DOF control system (translational + rotational)
* Validation under orbital perturbations (J2, drag, solar radiation pressure)
* Exploration of advanced optimisation methods (ABC, Firefly, DRL)
* Optimisation of control effort and fuel consumption
  
📌 **Key Takeaway:**
This work demonstrates how combining classical PID control with modern optimisation techniques can significantly enhance the performance of autonomous spacecraft rendezvous systems.

🤝 **Acknowledgment:**
This work was carried out as part of my Master’s research in Aerospace Engineering, focusing on control systems and space dynamics.
____________________________________________________________________________________________________________________________________________________________________
📁 **Repository Structure:**

/models        → Simulink models  
/scripts       → MATLAB scripts for optimisation  
/results       → Plots and simulation outputs  
/docs          → Supporting documentation 

▶️ **Instructions to Run:**

1. Run satellite_model.m to load all required initial parameters and configuration settings..
2. Run initial_position.slx to generate initial positions for both the chaser and target spacecraft.
3. Set position_control.m to simulation mode and execute batch simulations by selecting the desired model for fixed gain and for each optimisation method, which generates 100 data points for each scenario.
4. Set position_control.m to plotting mode and re-run the script to load the generated datasets and visualize the results through plots.

  ⚙️ Mode Selection:
   mode = 'simulate';   % Run batch simulations
   mode = 'plot';       % Load saved datasets and generate plots

____________________________________________________________________________________________________________________________________________________________________
**📚 References:**
* T. G. Luo Yazhong Zhang Jin, “Survey of orbital dynamics and control of space rendezvous,” College of Aerospace Science and Technology, National University of Defense Technology, Changsha 410073, China, Tech. Rep., 2013.
* ensatellite, Hill’s equations derivation and solution. [Online]. Available: https://ensatellite.com/hills-equations/.
* S. Zhuge, “Pid control theory,” Crystal Instruments, 2020.
* M. D. et al., “Particle swarm optimization,” Scholarpedia, 3(11):1486., 2008.
* S. Pandey, “Modern optimization techniques based pid controller tuning for the speed control of a dc motor,” Department of Electrical Engineering, National Institute of Technical Teachers’ Training and Research, Kolkata, India, Tech. Rep., 2023.
* H. G. Farhad Soleimanian Gharehchopogh, “A comprehensive survey: Whale optimization
algorithm and its applications,” Swarm and Evolutionary Computation- https://doi.org/10.1016/J.SWEVO.2019.03.004, 2019.
* C. K. Haydar Kilic U˘gur Y¨uzge¸c, “Improved antlion optimizer algorithm and its performance on neuro fuzzy inference system,” Neural Network World 29(4):235-254, 2019.
* Mathworks, Spacecraft dynamics. [Online]. Available: https://au.mathworks.com/help/aeroblks/spacecraftdynamics.html.

