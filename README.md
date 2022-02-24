### Software

---

`-` ATLAS software: v2.7.6

`-` R version: v4.0.5

### Comparative Cohort Settings

---

`-` Metformin vs Sulfonylureas

`-` Metformin vs DPP-4 inhibitors

`-` Sulfonylureas vs DPP-4 inhibitors

`-` Metformin+DPP-4 inhibitors vs Metformin+Sulfonylureas

`-` Metformin+DPP-4 inhibitors vs Sulfonylureas+DPP-4 inhibitors

`-` Metformin+Sulfonylureas vs Sulfonylureas+DPP-4 inhibitors

* that some patients were exposed to a second-line treatment, distinct from and subsequent to the first-line treatment. In these cases, we considered the patient to be right-censored at their last recorded time of follow-up

### Outcome

---

`-` HbA1c < 7.0

`-` Hypoglycemia

`-` Diabetic complications (IHD, Heart failure, Ischemic stroke, Diabetic retinopathy, Diabetic nephropathy)

`-` Diabetic nephropathy

### Covariate Settings

---

`-` Sex, Age group (If outcome: HbA1c)

`-` Sex, Age group, HbA1c (If outcome: Hypoglycemia)

`-` Sex, Age group, HbA1c, Statin (If outcome: Diabetic Complications, Diabetic Nephropathy)

### Propensity Score Adjustment

---

`-` Do you want to perform matching or stratification? 1:1, Match on propensity score

`-` What is the caliper for matching? 0.2, Standardized logit scale

`-` Tuend by 10-fold cross validation

### Outcome Model Settings

---

`-` Cox proportional hazards, calculated the hazard ratio (HR) for each of the outcomes of interest, along with associated 95% confidence intervals

- Right Censoring 1: When the patient’s observation ends
- Right Censoring 2: When diabetes drugs other than the target diabetes drugs were prescribed
- Right Censoring 3: When diabetes drugs continuous prescribe ends 

### Significance level correction

---

The results of repeated comparison of the same drugs can point out the problem of correction of significance level from a statistical point of a view, but it is a retrospective observational study using big data.

### Method

---

#### ATLAS

`-` New Estimation - Utilities - Import - json code copy and paste - Import click

![수정됨_ATLAS Image 3](https://user-images.githubusercontent.com/100256821/155483719-4320cc4f-a5b9-411b-97ed-c03d13b379cb.jpg)

`-` Download R package

#### R and Excel

`-` Running R package using Rstudio

`-` Exporting results (URL:https://www.ohdsi.org/wp-content/uploads/2018/10/OHDSI-Estimation-tutorial-CohortMethod-and-review-of-R-code.pdf (40P ~)

`-` Binding multi-center result from \Output\analysisSummary.csv (rr->HR, ci95lb->lower.HR, ci95ub->upper.HR, target->TargetN, comparator->compN)

![수정됨_Meta image](https://user-images.githubusercontent.com/100256821/155483723-70bf206f-ac1d-415a-9e2c-dc05e5d604e5.jpg)

`-` Running 'Meta.R' Code

![수정됨_1_F7_2_D1](https://user-images.githubusercontent.com/100256821/155483322-889ad789-2215-49cc-beea-51d26cdc80c0.jpg)

### Funding

---

This research was supported by a grant of the Korea Health Technology R&D Project through the Korea Health Industry Development Institute (KHIDI), funded by the Ministry of Health & Welfare, Republic of Korea (grant number: HI19C0543).
