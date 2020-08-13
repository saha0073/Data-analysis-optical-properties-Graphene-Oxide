# Data-analysis-optical-properties-Graphene-Oxide
A statistical data analysis technique to study the optical properties of Graphene Oxide has been presented here. The results obtained from this data analyses method has been published in [Journal of Applied Physics, in 2016](https://aip.scitation.org/doi/abs/10.1063/1.4955140). The paper also contains the brief explanation of physics, details of the data analysis technique, and the conclusions derived from this study.

## Abstract
Graphene oxide (GO), a precursor of graphene having both sp2 and sp3-hybridized carbon atom, increasingly attracted cross-discipline researchers for its controllable properties by reduction of oxygen containing groups. We reported precise control of non-linear optical properties of RGO in femtosecond regime with increased degrees of IR reduction measured by open aperture z-scan technique. The values of two-photon absorption co-efficient (∼0.0022–0.0037 cm/GW for GO, and ∼0.0128–0.0143 cm/GW for RGO) and the saturation intensity (∼57 GW/cm2 for GO, and ∼194 GW/cm2 for RGO) increase with increasing reduction, indicating GO and RGO as novel tunable photonic devices.

## Brief description of the data analysis technique
The data analysis technique consists of several steps such as preprocessing dataset, defining model, making prediction and finally extraction of model parameters (saturation intensity, absorption coefficient) following the optimization.

* 1: Cleaning, pre-processing the experimental dataset.
* 2: Defining the space dependent differential equation for intensity. (eq 2, eq 3)
* 3: Prediction of intensity by solving the differential equation with Runge-Kutta method.
* 4: Calculation of mean squared error (MSE) between predicted and experimental intensity values.
* 5: Optimization of model parameters (saturation intensity, absorption coefficient) with gradient descent type technique.(fig 8, table II)

## Authors
The code was primarily developed by [Subhodip Saha](https://www.linkedin.com/in/subhodip-saha-88345aa8/), experiments were performed by [Sayantan Bhattacharya](https://scholar.google.com/citations?user=AI0JjswAAAAJ&hl=en), under the guidance of [Prof. Prasanta Kumar Datta](http://www1.iitkgp.ac.in/fac-profiles/showprofile.php?empcode=bbmcZ&depts_name=MP). If you have any questions feel free to send an email to [saha0073@umn.edu](mailto:saha0073@umn.edu).

Happy learning!
