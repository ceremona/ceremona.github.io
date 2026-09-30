---
layout: ../layouts/BaseLayout.astro
title: "..."
---
<div class="hero">
  <h2>Systems Engineering & Physical Computing Research</h2>
</div>

<div class="prose">

## Test Engineering — Instrumentation, Calibration & Test Data Systems

Test and measurement engineering for physical systems: instrument installation
and commissioning, calibration and preventive maintenance, custom fixtures,
data-acquisition pipelines, and root-cause triage of hardware, sensor, and data
anomalies. Physics foundation, applied across industrial, energy, and scientific
measurement systems.

[ceremona@gmail.com](mailto:ceremona@gmail.com) · 206.414.9448 · [github.com/ceremona](https://github.com/ceremona) · [linkedin.com/in/ceredavis](https://www.linkedin.com/in/ceredavis)

## Trajectory

Physical measurement systems end to end: designing, building, commissioning,
calibrating, and maintaining instruments and data-acquisition infrastructure;
measuring industrial thermal processes (pyrolysis, gasification, pressurized
reactor systems); and separating true physical signals from equipment and data
artifacts. Physics foundation with published field-geophysics research.
Currently focused on test infrastructure and test-data systems.

## Professional Experience

**Independent Systems Engineer & Research Consultant** · Jul 2012 – Present
*Berkeley, CA · Hybrid / Remote*

Deliver instrumentation, data-acquisition software, and physical-measurement
analysis for industrial, energy, and environmental clients.

- **ALL Power Labs (2019):** Designed, built, commissioned, and field-tested a
thermal measurement and monitoring system for industrial pyrolysis and
gasification reactors — measuring heat output across varying feedstock input
rates. Owned sensor selection, analog frontend and PCB development (KiCad,
LTSpice), signal conditioning, calibration, and real-time data acquisition
(LabVIEW, Python) under thermal and electrical noise. Planned integration into
a downstream data-analytics pipeline.
- **Inspect Air Quality (2017):** Wrote data-acquisition and control code for
environmental sensor systems on 32-bit microcontrollers; authored deployment
SOPs and programming documentation enabling non-specialist operators to run
equipment in the field.
- **ElectroTherm (2014–2015):** Analyzed solar radiance measurements for a
thermal solar tracker developer. Integrated client time-series with NREL
reference datasets to quantify power-conversion gains; validated measured
performance against a national reference standard.
- **Energy R&D client (2013–2014):** Operated and maintained instrumentation
monitoring thermal output of a pressure-vessel reactor system; calibrated
thermocouples and thermal sensors, maintained experimental records, and built
lab data-acquisition and computing infrastructure.
- **Mechatronic & kinetic systems:** Sensor-driven kinetic assemblies with
real-time closed-loop motor control; CAD (Fusion 360), embedded programming
(C/C++, Python, Arduino microcontrollers), analog sensor integration.
- **Research & prototyping:** Iterative hardware/software design for scientific
instrumentation; laboratory testing protocols, data analysis, and materials
characterization.

**Principal Platform Design Engineer, VCE** · Jun 2011 – Jun 2012 · Full-time
*San Jose, CA · On-site*

- Architected fully integrated compute/storage/network platforms for enterprise
deployment (EMC, Cisco, VMware stack).
- Owned cross-subsystem integration and hardware-to-orchestration validation loops.

**Senior Solutions Architect, Wholem IT** · May 2010 – Sep 2010 · Contract
*Greater Seattle Area · Hybrid*

- Directed the enterprise migration of an entire institutional IT infrastructure
to Google Workspace. Built the transition roadmap and coordinated execution
across identity/security, DNS, databases, email, and filesystems.
- Required cross-departmental diplomacy and director-level leadership; delivered
a cohesive, institution-wide cutover with zero downtime.

**Cofounder & Lead Architect, Election Verification Network** · Jul 2003 – Jul 2010
*Seasonal / National*

- Architected and built an integrated front-end/back-end incident-reporting
system in partnership with Verified Voting and CPSR (Computer Professionals
for Social Responsibility) — end-to-end data capture, structured records, and
database design.
- Owned data integrity for a national monitoring program: accurate capture,
review workflows, and auditable, traceable records.

**Pre / Post-Sales Enterprise Network Engineer, F5 Networks** · Oct 2006 – Jun 2010
*Seattle, WA · On-site*

- **Network forensics & protocol analysis:** Used Wireshark and custom tooling for
deep L1–7 packet and protocol analysis. Reproduced complex customer network
pathologies in the lab, isolating root cause across routing, TCP/IP, SSL, and
application-layer behavior.
- **Systems prototyping:** Built complex, multi-vendor lab environments (Cisco
6500, VMware ESX, LanForge packet generators) to mirror production failure modes.
- **Automation & performance:** Developed test automation, instrumentation, and
standardized validation protocols for Alpha/Beta release testing; led weekly
vendor technical support case reviews and fed supportability findings back to
product engineering.

**Senior System Architect & Engineer, University of Washington** · Jul 1997 – Jul 2005
*Seattle, WA · Full-time*

- **Kernel & distributed systems:** Modified Linux kernel headers and source in C
for compatibility with the OpenMosix distributed process-migration patch.
Debugged race conditions and memory-model issues across a clustered Unix
environment.
- **Cluster architecture:** Architected and built a research-grade Unix compute
cluster and network infrastructure from the ground up. Developed load-gathering
tools (Python), TCP/IP state-tracking utilities, and automation frameworks for
cluster software deployment and performance regression testing.
- **Virtualization:** Deployed and managed Xen and VMware virtual-desktop
environments.

**Unix Systems Administrator, North Seattle Community College** · 1996–1997

**Unix Systems Deployment Engineer, Digital Systems Inc.** · 1995

**Science Technician, South Pole Station, Antarctica** · 1993–1994
*Atmospheric ozone / optical instrumentation*

- **Instrument operations:** Operated, maintained, and repaired optical, UV-A/B/C,
and aurora/airglow measurement instruments for atmospheric ozone research.
- **Field conditions:** Collected continuous data through the Antarctic winter;
diagnosed and repaired instrument failures in isolation, with no resupply, no
repair parties, and no possibility of recovering lost data.

**Seismological Analyst (Intern), University of Alaska Fairbanks — Geophysical Institute** · 1992–1993
*Field seismology / multi-station data analysis*

- **Field deployment & analysis:** Assisted in regional seismometer field
deployment; performed multi-station time-series analysis on seismic network data.
- **Anomaly triage:** Identified anomalous simultaneous signals across stations,
showed the simultaneity could not be explained by acoustic propagation, and
traced the signal to volcanic lightning — separating a true physical signal from
instrumentation behavior, leading to a co-authored publication.

## Selected Projects & Research

**Pulse-Response Test Pipeline** · 2026 · [github.com/ceremona/pulse-pipeline](https://github.com/ceremona/pulse-pipeline)
Bench fixture and analysis pipeline measuring supercapacitor ESR and capacitance
from switched-load pulse response. Fixture modeled in NGSpice; analysis validated
by recovery of known injected values; oscilloscope capture via SCPI over TCP;
per-pulse QA and provenance records in SQL.

**Battery Cycle-Life Data Pipeline** · 2026 · [github.com/ceremona/battery-cycle-life](https://github.com/ceremona/battery-cycle-life)
Analysis of public Li-ion cycling data (NASA PCoE): capacity fade, coulombic
efficiency, and DCIR from pulse response, with a per-cycle integrity audit —
independent capacity estimates, sampling-gap detection, metadata traceability —
and a SQL query layer.

**Extropic.AI — Computing using KL Divergence** · 2026 · [github.com/ceremona/Extropic-ai-examples](https://github.com/ceremona/Extropic-ai-examples)
Gibbs sampling to reconstruct an image of corrupted pixels using a Bayesian
Markov Random Field method.

**CA-as-Reservoir** · 2026 · [github.com/ceremona/CA-as-Reservoir](https://github.com/ceremona/CA-as-Reservoir)
Investigating cellular automata as discrete physical reservoirs for temporal
computation. Characterizing memory capacity and nonlinear dynamics at the edge of
chaos; exploring implications for analog and unconventional computing substrates.

## Publications

- S.R. McNutt & C.M. Davis, "Lightning Associated with the 1992 Eruptions of
Crater Peak, Mount Spurr Volcano, Alaska," *Journal of Volcanology & Geothermal
Research*, 2000.
- S.R. McNutt & C.M. Davis, "Volcanic Lightning at Mt. Spurr, 1992," Colima
Volcano: Fourth International Meeting, Colima, Mexico, 1994, Abstracts Volume, p. 112.
- C.M. Davis, "Volcanic lightning observations" — Mount Spurr (EOS/AGU, 1993).
- C.M. Davis, "A Comparison of Micro-Viscosity to Shear Viscosity in Lyotropic
Nematic Liquid Crystals," *Bulletin of the American Physical Society*, 1993.

## Tools & Methods

**Languages:** Python, C, C++, SQL, Shell
**Test & Measurement:** instrument installation and commissioning, calibration
and preventive maintenance, thermocouple calibration, sensor characterization,
signal conditioning, measurement uncertainty, SOP development and documentation,
root-cause analysis
**Data:** NumPy, SciPy, pandas; time-series analysis, uncertainty quantification,
structured experimental records, database-backed tooling
**Systems:** Linux internals, TCP/IP networking (L1–7), virtualization, automation
frameworks, git, CI
**Hardware:** microcontrollers, embedded systems, data acquisition, LabVIEW,
SPICE, KiCad, CAD (Fusion 360)

## Education

- **BS, Physics** — University of Alaska Fairbanks, 1992
- **Graduate coursework, Statistics & Epidemiology** — University of Washington,
2000–2006
- **MA, Philosophy of Science** — Leibniz Universität Hannover, 2022

## Community

- Education Exhibit Designer — California Historical Radio Society (2026).
- Board Member — Counter Culture Labs (2014–2016).

---
</div>

