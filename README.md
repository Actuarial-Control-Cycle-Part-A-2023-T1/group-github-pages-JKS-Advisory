# JKS Advisory - 2023 SOA Student Research Case Study
![bg image](https://raw.githubusercontent.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/main/Background%20Image.png)
> 
Source: https://unsplash.com/@mattpalmer

## Storslysia Relocation Social Insurance Program
***Managing Displacement Risk in the Face of Climate Change***

Authors: Abiya Hanif, Ajaey Loganathan, Jenny Zhang, Kenuka Wijayatunga, Sarah Liang

<img width="250" alt="image" src="https://raw.githubusercontent.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/main/Logos.png">

---

## Context
JKS Advisory have created a Social insurance Program to help analyse, manage and monitor the displacement risks associated with climate change for Storslysia's Government. To find out more information about our program design and recommendations, keep scrolling! 

  - For more contextual background on the 2023 SOA Research Challenge, click [here](https://www.soa.org/research/opportunities/2023-student-research-case-study-challenge/).
  - To access JKS Advisory's full report, click [here](https://unsw-my.sharepoint.com/:b:/g/personal/z5258150_ad_unsw_edu_au/EbPL72i3ZApNnoQcUHvndToBX1g4ZwKD7fCn0H0Wc062nw?e=DNzgfl).
  - To access JKS Advisory's Frequency and Severity Modelling R Studio code, click [here](https://github.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/blob/main/Frequency%20and%20Severity%20Modelling.r)

---

### Table of Contents

1. [Executive Summary](https://github.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/blob/main/README.md#1-executive-summary)
2. [Program Design Considerations](#2-program-design-considerations)
3. [Key Problems](#3-key-problems)
4. [Program Solution](#4-program-solution)
    - 4.1. [Voluntary Relocation Scheme](https://github.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/blob/main/README.md#41-voluntary-relocation-scheme)
      - 4.1.1. [Relocation Incentives](#411-relocation-incentives)
      - 4.1.2. [Modelling Voluntary Relocation Costs](https://github.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/blob/main/README.md#412-modelling-voluntary-relocation-costs)
    - 4.2. [Involuntary Relocation Scheme](#42-involuntary-relocation-scheme)
      - 4.2.1. [Modelling Involuntary Relocation Costs](#421-modelling-involuntary-relocation-costs)
    - 4.3. [Alternative Solutions Considered](#43-alternative-solutions-considered)
    - 4.4. [Program Implementation Timeline](#44-program-implementation-timeline)
5. [Monitoring Results](#5-monitoring-results)
    - 5.1. [Analysing Key Metrics](#51-analysing-key-metrics)
    - 5.2. [Sensitivity Analysis](#52-sensitivity-analysis)
6. [Risk Considerations](#6-risk-considerations)
7. [Ethical Considerations](#7-ethical-considerations)
8. [Limitations](#8-limitations)
9. [Final Recommendations](#9-final-recommendations)
10. [References](#10-references)

---

## 1. Executive Summary
JKS Advisory recommends implementing a social insurance program (“Program”) to help Storslysia manage the financial risks associated with catastrophe-related displacement. The Program will reduce Storslysia’s costs, injuries, and deaths resulting from catastrophe climate-related events through addressing involuntary and voluntary relocations. As voluntary relocations can typically be achieved at a lower cost, JKS Advisory has recommended both cash-based compensation and in-kind support schemes to incentivise households to move from high-risk regions into lower-risk regions. The Program will operate from 2023 to 2040, to ensure a 90% confidence level of not exceeding 10% of Storslysia’s GDP in any given year. ​

A holistic analysis of the Program is provided through discussing various elements of the actuarial control cycle, including identifying key problems, designing potential solutions, and monitoring results. Additionally, a discussion into key risk considerations, ethical implications and data limitations is presented. Unless specified otherwise, all calculations provided throughout this report will be in relation to Climate Scenario – SSP2-3.4, as this is the most probable outcome.

## 2. Program Design Considerations
The Program design process reflect elements of the actuarial control cycle, including defining key problems, designing potential solutions, building a model, setting assumptions, conducting sensitivity tests, monitoring results, and updating for experience.
<img align="left" width="220" src="https://raw.githubusercontent.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/main/Figure%201.png">

***Key Problems***
* High death and injury numbers after catastrophic climate events
* Involuntary, or reactive relocation, is very costly

***Key Solution – The Program***
* Voluntary relocation incentives using cash-based and in-kind support
* Involuntary relocation and household damages covered by insurance scheme
* Alternative solutions: conservation programs and housing safety standards

***Monitoring the Program***
* Monitor the Program annually using key metrics and sensitivity analyses
* Update the Program annually for new claims experience, economic environment and admin expenses

## 3. Key Problems
A key issue that arises from catastrophic climate events is the loss of life as well as injuries to residents. These events also present significant property damage costs and force households to relocate reactively, which is costly and leads to greater social disarticulation, psychological impacts, and higher unemployment compared to voluntary relocation.

## 4. Program Solution
To address the key problems identified above, JKS Advisory proposes the Program as a solution to reduce Storslysia’s financial risk to climate catastrophe-related displacement. The Program addresses voluntary and involuntary relocation through:

  - ***Voluntary Relocation Scheme:*** citizens will be incentivised to voluntarily relocate away from high-risk regions and into low-risk regions through property buy-outs, government grants, new employment and housing opportunities
  - ***Involuntary Relocation Scheme:*** citizens will have mandatory insurance covering property damage and relocation costs after climate catastrophes

## 4.1. Voluntary Relocation Scheme
The Program involves incentivising citizens in high-risk regions to voluntarily relocate into lower-risk regions under the Voluntary Relocation Scheme, which commences in 2024. High-risk and low-risk regions were determined through analysis into each region’s frequency and average severity of climate events, as well as the average number of associated deaths and injuries.
<p align="center">
  <img width="700" src="https://raw.githubusercontent.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/main/Figure%202.png">
</p>

Figure 2 shows that Regions 2 and 5 are the riskiest and as such, households in these regions will qualify under the Voluntary Relocation Scheme. In comparison, Regions 4 and 6 have lower risk and will host the newly relocated individuals from Region 2 and 5. Population movement incentivised by the Program is in Figure 3.
<p align="center">
  <img width="300" src="https://raw.githubusercontent.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/main/Figure%203.png">
</p>

## 4.1.1. Relocation Incentives
The Voluntary Relocation Program, operational from 2023 – 2040, provides multiple cash-based compensation and in-kind support to incentivise movement from high-risk regions 2 and 5 into lower-risk regions of 4 and 6. These are summarised below.

**Incentive 1: Property Buy-outs**

To incentivise voluntary relocation, the government will identify properties in high-risk areas such as earthquake or flood-prone zones and offer to buy them at fair-market value. The net present value of these property-buyouts from 2023 to 2024 is forecasted to be Ꝕ593.5m, achieved by analysing the property value distributions in regions 2 and 5. The government should target low property values ≤Ꝕ250,000, as cheaper houses are typically at higher risk during a catastrophic climate event due to lower building standards and high-risk locations. Strategic and systematic government buy-outs will incentivise households to voluntarily relocate to safer regions 4 and 6 that will have newly constructed houses, decreasing Storslysia’s long-term costs from climate-related catastrophes. 

**Incentive 2: New Employment Opportunities**

New employment opportunities in regions 4 and 6 can encourage voluntary relocation by providing individuals with greater career prospects. The Storslysia government can create new employment opportunities in these regions by making direct investments in new jobs, supporting education and training initiatives, funding R&D, as well as fostering entrepreneurship.

Under the Voluntary Relocation Scheme, over 40,000 households are forecasted to relocate into regions 4 and 6 annually which increases the demand for goods and services. This will create new job opportunities and attract further talent into the lower-risk regions 4 and 6. JKS Advisory projects an investment of Ꝕ500m in the first year, and total investment in creating new jobs from 2023 – 2040 to be Ꝕ10b. Annual investments into job creation is anticipated to decrease from ~0.04% to ~0.03% of GDP. Therefore, investment into employment incentives are a highly effective means to encourage relocation while keeping total costs below 10% of Storslysia’s annual GDP with a high degree of certainty.

The above proportions are based off previous case studies, such as NSW Government’s (NSW Treasury, 2023) investment of over 240,000 AUD to create 12 full-time jobs. These assumptions have been used throughout the Program model, with appropriate conversion rates applied. 

**Incentive 3: Individual and Business Relocation Grants**

Voluntary relocation from high-risk to lower-risk areas will further be incentivised through a range of government grants, shown below, which have all been based off NSW Government Revenue grants (NSW Treasury, 2015). While these grants target different demographics, they each help cover expenses such as moving costs and temporary accommodation. 

<p align="center">
  <img width="700" src="https://raw.githubusercontent.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/main/Grant%20Types.png">
</p>

**Incentive 4: Government Infrastructure Investment**

A greater investment into property development and community facilities in regions 4 and 6 will incentivise voluntary relocation into these areas, particularly region 6 where absolute vacancy is low. Hsieh et al. (2012) highlights that government investment into new property development can occur on the city fringe (greenfield) or within existing urban areas (infill). To encourage adoption of this form of voluntary relocation, significant annual investments into infrastructure and social services will be needed to improve the relocators’ quality of life. This is particularly important for region 6, where total health care and social assistance revenue per capita is the lowest, suggesting that further infrastructure development is needed.

## 4.1.2. Modelling Voluntary Relocation Costs
Key economic and demographic assumptions underpin the Voluntary Relocation Scheme, including:
  - ***Population growth:*** Based on world population on given SSP scenarios
  - ***GDP growth:*** Based on world GDP on given SSP scenarios
  - ***Inflation:*** 2% average global inflation
  - ***Currency conversion:*** Based on currency conversion rate of 1 US$ = 1.321Ꝕ

## 4.2. Involuntary Relocation Scheme
Under Storslysia’s Involuntary Relocation Insurance scheme which commences in 2023, all citizens who experience total loss of property due to climate-related catastrophes will be covered if they are older than 18 and they own a property in Storslysia or a mortgage. This policy will be compulsory to be purchased from the government. For a citizen to claim insurance funds, they must file a claim with evidence for property losses due to a natural hazard event covered under the insurance policy, and their claim will be assessed. This insurance policy will cover the full replacement cost of home and contents less a Ꝕ5,000 deductible. In the case of landlord claims, a rental agreement must be provided. 

## 4.2.1. Modelling Involuntary Relocation Costs
The cost of involuntary relocations can be broken into the frequency and severity of hazard events, as well as the cost of temporary housing. 

### Frequency

Frequency was modelled using Peril Type and Event Size (Minor, Medium, Major).

*Peril Type:* Initially, the provided ‘Hazard Events’ dataset had many claims with multiple perils listed and no indication of a primary peril. Hence, the first step was to allocate a Peril Type by:
1. Grouping the claims data by ‘Hazard Event’ and calculating summary statistics.
2. Scaling all the values by a log factor to ensure comparability.
3. Identifying which listed peril most closely resembles the claim by selecting the pair with the shortest Euclidean distance based on the calculated statistics. 
4. Groups with low observations e.g. Coastal, Gog, Heat, Landslide and Wildfire were grouped into an “Other” category.

*Event Size:* Event size was determined by first inflating historical property damage costs to 2022 present value using inflation rates and population growth. Population growth was accounted using an assumption that hazard events will have a greater associated property damage for a larger number of people in the affected area. Once claims were inflated, events were classified into minor, medium and major with breakpoints at Ꝕ500,000, Ꝕ5,000,000 and Ꝕ50,000,000. All events larger than Ꝕ50,000,000 were separately modelled as extreme hazard events.

*Modelling Minor, Medium and Major Frequencies:* The two key distributions considered for modelling frequency were Poisson and Negative Binomial. The comparison between the empirical and theoretical distributions for each of these can be found in the diagrams below. Figure 4 shows that the Negative Binomial CDF fits the empirical data to a higher degree than the Poisson CDF as it allows for greater variance. Furthermore, a chi-squared test was conducted to assess the fit of the data against a Negative Binomial distribution. This yielded a p-value < 0.05, and thus, was selected as our distribution. Thus, our initial hypothesis was that the frequency was Negative Binomial distributed.

<p align="center">
  <img width="700" src="https://raw.githubusercontent.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/main/Figure%204.png">
</p>

After creating separate datasets for each peril grouping and event size, the 95th negative binomial quantile was estimated to obtain a yearly frequency estimate. The 80th quantile was used to ensure that frequency would not be underestimated as it is necessary to keep total expenses below 10% of GDP with a high degree of certainty. In some instances, if there was a lack of data or the estimated frequency was 0, a frequency of 0.5 was instead used as there should always be a non-zero probability of an event occurring. The final estimated frequencies are as follows:

<p align="center">
  <img width="700" src="https://raw.githubusercontent.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/main/Frequency%20Table.png">
</p>
During EDA, some regions were discovered to be more exposed to certain perils, therefore the frequencies of events were split amongst the regions. A ratio was determined by finding the historical occurrence of each peril in each region and this ratio was applied to split each frequency into the 6 regions.

### Severity

<img align="right" width="190" src="https://raw.githubusercontent.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/main/Figure%205.png">
Once frequency estimates for different sized perils for each region were obtained, severities needed to be estimated for the same categories of peril, size, and region. As seen in Figure 5, which displays historical claim severity after accounting for inflation and population growth, there are no trends present. Consequently, severity prediction was modelled utilising historical averages.

### Catastrophic Events
<img align="right" width="270" src="https://raw.githubusercontent.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/main/Figure%206.png">

The severity of Catastrophic events was modelled using Extreme Value Theory and the Peaks over Threshold (POT) method, which is a method that deals with the tail-end of a distribution. 

  - Using a Mean Residual life plot and its initial point of linearity, a threshold was selected, and Catastrophic events were defined as ones which exceeded the threshold of Ꝕ50,000,000.
  - MLE determines parameter estimates for a Generalised Pareto Distribution, common for modelling extreme events. Fit was confirmed using a Bootstrap test.

To ensure certainty of program cost, the 95th qauntile value was chosen for Catastrophic event severity. Similar to Minor, Medium and Major events, the 80th qauntile of a Negative Binomial distribution was used for Catastrophic event frequency – supported by a chi-squared test.

### Total Involuntary Relocation Costs

Within each category of Peril Type, Event Size and region, frequency and severity were multiplied together to obtain total estimated claims costs. The estimated frequencies for minor, medium and major events were inputted into the CO2 emissions model to be projected until 2100. Thus, the total cost was projected using population growth and frequency projections over time. Finally, within each region, a proportion of the total damage costs for each year were assumed to be attributable to total loss (thus, resulting in involuntary relocation) based on property value distribution and likelihood of total loss. A multiplier of 125% was then added to consider the increased cost of labour and housing following a natural disaster and a multiplier of 157.5% was added to account for replacement of belongings and household items. On top of the cost of rebuilding the destroyed homes, involuntary relocation costs also include temporary housing expenses associated with waiting for permanent housing. This was done by estimating the number of displaced individuals multiplied by 24 months and the cost of temporary housing per person per month to access temporary housing.​

## 4.3. Alternative Solutions Considered
Alternative methods were considered to support Storlysia in managing the risks associated with catastrophe-related displacement, summarised below.

**Upgrading Housing Safety Standards**

An alternative method to voluntary relocation is upgrading safety standards for existing houses. For example, to help protect against wind damage, roofs can be reinforced using truss bracing, and hurricane resistant doors and storm shutters can be installed. For minor flooding, utilizing moveable flood walls and sealant can significantly reduce property damage. Similar measures can be applied to address each relevant hazard to improve the safety of existing houses. In general, adaptation spending on assets to improve their safety standards should constitute around 1-2% of total infrastructure spending per year (McKinsey, 2020).

**Climate Change Conservation Programs**

An alternative method to relocation is investing into environmental conservation programs to minimize climate change impacts overtime. Potential programs include:
  - Renewable energy infrastructure, e.g. solar energy which will minimise the use of fossil fuels and greenhouse gases that get released into the atmosphere.
  - Employment of effective recycling and waste reduction initiatives.
  - Deforestation protection & active reforestation, decreasing harmful CO2 gases.
  - Promote the use of sustainable agriculture methods, e.g. reducing fertiliser use.

**Increased Community Education**

Alternatively, increased community education could be implemented with a focus on:
  - Raising awareness about the causes of climate change and how to reduce its effects through sustainable practices, e.g. recycling.
  - Safe response protocals in the case of natural hazard events, including education on easily accessible shelters.

## 4.4. Program Implementation Timeline

To maximise the success of the Program across the short and long-term, the government must raise enough capital to finance the projected, aggregated expenses for both relocation types.  The Program’s financial sustainability will be dependent on the funding sources calculated by other Storslysian task forces, e.g. premiums.

The primary reason emphasis is placed on voluntary location is due to the additional costs of involuntary relocation. Involuntary relocation costs approximately Ꝕ156k per person, whilst voluntary relocation costs around Ꝕ53k per person. To ensure solvency with a high degree of certainty, economic capital will be held to keep the Program afloat. The Institute and Faculty of Actuaries (2016) state the minimum capital requirement (MCR) has a “floor of 25%” with an 85% confidence interval (CI) over a one-year period. 

The Program’s 2023 forecasted expenses of Ꝕ8.5b will consist solely of the Involuntary Relocation Scheme as the Voluntary Relocation Scheme does not commence until 2024. When the 25% MCR is applied to ~Ꝕ8.58b, it can be deduced that Storslysia should reserve a minimum of Ꝕ10.5b in 2022, which is Ꝕ8.58*125% discounted to present day in 2022. As the Institute (IFAA, 2016) states that the CI of the floor MCR applies to one-year risk values, the economic capital for the program should be monitored every year, as mentioned in the timeline. This means that required reserves will need to be monitored and updated each year for potential capital injections in order for the program to remain solvent.

<p align="center">
  <img width="700" src="https://raw.githubusercontent.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/main/Figure%207.png">
</p>

## 5. Monitoring Results
After initial implementation of the Program according to Figure 7, the Program’s effectiveness will be continually monitored through an annual reporting process. This will involve analysing key metrics, identifying new trends and updating processes according to new claims experience and economic environment. 

## 5.1. Analysing Key Metrics
To monitor the results and re-assess the assumptions, JKS Advisory has recommended analysing the following key metrics, so Storslysia does not exceed 10% of their GDP in costs and has enough capital to keep the program solvent.
<p align="center">
  <img width="700" src="https://raw.githubusercontent.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/main/Key%20Metrics%20Table.png">
</p>

## 5.2. Sensitivity Analysis
The climate scenarios range from Case 1, which is optimistic regarding conservation and predicts a decrease in natural hazard frequency, to Case 5, which assumes the ‘worst-case’ scenario and predicts an exponential increase. As seen in Figure 8, the Net Present Value (NPV) of the costs are higher without the Program by an approximate factor of 2x for all cases. Note: until the conclusion of the Program in 2040, the cost with the program is greater than the cost in its absence. Only in perpetuity where the impacts of the scheme can be observed are savings generated. Figure 9 illustrates the increasing cost such that Case 5 > Case 3 > Case 2 > Case 1. Additionally, by relocating individuals away from the riskiest areas, there is a 47% decrease in the number of deaths and 39% decrease in the number of injuries by 2100. At the forefront of our scheme is the individual – not only providing monetary support but aiding health and wellbeing.

<p align="center">
  <img width="700" src="https://raw.githubusercontent.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/main/Figure%208%20%26%209.png">
</p>

Moreover, a 90% confidence level can be attributed to the natural hazard costs incurred by Storslysia. Grouping events by Year provides a total annual cost for each historic year, with 61 total observations. Given the high observations, Central Limit Theorem and the Normal Distribution assumption can be made and used to determine a 90% confidence level for total yearly costs – a value of approximately Ꝕ 8.96 billion which is well under the Ꝕ 10.55 billion we have predicted for 2022. Additionally, across all years, the maximum percentage of GDP used by the Program costs sits at approximately 1%. This is well below the required 10% target - providing additional certainty.

To further ensure the long-term sustainability of this program, population movement and perpetuity assumptions were adjusted to conduct stress testing. The table below shows the NPV into perpetuity of these changes in billions (Ꝕ). Even in the most extreme case E, the expenses of the program do not exceed 1% of GDP in a year, providing confidence that it is highly unlikely that the program will ever exceed 10% of Storslysia GDP.

<p align="center">
  <img width="700" src="https://raw.githubusercontent.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/main/Assumption%20Scenarios%20Table.png">
</p>

## 6. Risk Considerations
<p align="center">
  <img width="700" src="https://raw.githubusercontent.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/main/Risk%20Considerations%20Table.png">
</p>

## 7. Ethical Considerations
Equality vs equity when offering the voluntary relocation program. The proposed program is focused on buying out properties of lower economic value, to target those in lower socio-economic status, and reduce costs for the program. Although this does not achieve equality for all citizens, from a virtue ethics approach, targeting those that are more in need of financial assistance to relocate is the right way of moving forward, as the grants and extra employment opportunities created through the program will have a relatively more significant impact on those from a lower-socioeconomic background.

Ethics of voluntary relocation must be considered in relation to those that are moved. Although the program is voluntary, individuals may feel pressured to move as they are warned about the potential risks to their properties and lives (Johnson, 2012). There may also be risks to mental health due to moving away from family and friends, or from an established working situation. In addition, inter-regional cultures may be drastically different, such as in Canada where certain regions predominantly speak French. This may cause extra struggle through having to learn another language. Although these are negatives that must be considered, from a utilitarian framework, they are necessary to achieve overall better outcomes for citizens (Firenze, 2013). The initial hardship from relocating likely does not compare to the potential hardship from major property damage and loss of life without relocation, so it can be viewed as a necessary consequence for greater good in the future, thus aligning with utilitarian ethics. Investments into infrastructure in the safer regions, which is part of the program, further aim to foster a sense of community amongst relocated individuals, and the creation of employment opportunities aim to alleviate any hardship from loss of income due to relocation. When considered in addition to grants provided by the government, the overall benefits of the program far outweigh the negatives.

Another ethical consideration is regarding burden sharing, and the effect on current residents of a region of an influx in people moving in. Since the relocated individuals will mostly be of a lower socio-economic background, the question arises whether the quality of life of current residents is being reduced due to having to accommodate for people that may be struggling for employment, despite initiatives proposed to increase job supply in safer areas (White et al., 2020). In addition, in regions where further housing development is required, the compensation for loss of land, assets or livelihood, for example through the government taking over farmland to build houses, may not be adequate. 

For infill development, the increased housing density and possible loss of green spaces in residential areas may detract from existing resident’s property value as well (Gibler, et al., 2014). However, when considering the common good approach to ethics, the individuals of a society have their own good inextricably linked to the good of the community. Thus, through the new jobs created and the investments into improved infrastructure in the region, society will holistically benefit from the voluntary relocation program, even if certain individuals may be worse off as a result.

## 8. Limitations

### Program Limitations

One limitation of the program is the socioeconomic situation of the two regions to which residents are to be moved. Although regions 4 and 6 are the safest, they also have the lowest GDP’s and population densities, suggesting poorer social situations than the other regions. Furthermore, they both have low vacancy rates, meaning more housing development projects will need to be conducted by the government, which is less ideal than buying out already existing properties.  

### Data Limitations
<p align="center">
  <img width="700" src="https://raw.githubusercontent.com/Actuarial-Control-Cycle-Part-A-2023-T1/group-github-pages-JKS-Advisory/main/Data%20Limitations%20Table.png">
</p>

## 9. Final Recommendations

Designing a social insurance program that effectively manages Storslysia’s exposure to climate-related catastrophes is an iterative process and requires careful oversight. JKS Advisory has provided the framework for a comprehensive social insurance program, “Program”, which has been stress-tested for various climate change scenarios, as well as economic and demographic assumptions. The Program consists of two schemes, the Voluntary Relocation Scheme and the Involuntary Relocation Scheme, which will work in tandem to ensure a 90% confidence level of not exceeding 10% of Storslysia’s GDP in any given year. Through continued updating and monitoring of the Program, Storslysia will be able to alleviate its exposure to catastrophe-related displacement risk and protect citizens to ensure a sustainable future.

## 10. References
> 1. Cabinet, D.of P. (2023) $100 million Jobs Boost for Regional NSW, NSW Government. NSW Government. Available at: https://www.nsw.gov.au/media-releases/100-million-jobs-boost-for-regional-nsw#:~:text=%E2%80%9CThe%20Regional%20Job%20Creation%20Fund,regions%2C%E2%80%9D%20Mr%20Toole%20said (Accessed: March 27, 2023). 

> 2. Revenue NSW (2023) Regional relocation grant, Revenue NSW. Revenue NSW. Available at: https://www.revenue.nsw.gov.au/grants-schemes/previous-schemes/regional-relocation-grant#:~:text=The%20Skilled%20Regional%20Relocation%20Incentive,least%2012%20months%20between%20payments (Accessed: March 27, 2023). 

> 3. Hsieh. W et al. (2012). Supply-side Issues in the Housing Sector. Reserve Bank of Australia. Available at: https://www.rba.gov.au/publications/bulletin/2012/sep/2.html (Accessed March 27, 2023)

> 4. Institute and Faculty of Actuaries (2016). Solvency II. Institute and Faculty of Actuaries. Available at: https://www.actuaries.org.uk/system/files/field/document/IandF_SA2_SolvencyII_2016.pdf (Accessed March 27, 2023)

> 5. Johnson, C.A. (2012). Governing climate displacement: the ethics and politics of human resettlement. Environmental Politics, 21(2), pp.308–328. doi:https://doi.org/10.1080/09644016.2012.651905.

> 6. Bonde, S. and Firenze, P. (2013). A Framework for Making Ethical Decisions. [online] Brown University. Available at: https://www.brown.edu/academics/science-and-technology-studies/framework-making-ethical-decisions

> 7. White, R.G et al. (2020). Systematic review of factors associated with quality of life of asylum seekers and refugees in high-income countries. Conflict and Health, 14(1). doi:https://doi.org/10.1186/s13031-020-00292-y

> 8. Gibler, K.M. et al. (2014). The effect of new residential construction on housing prices. Journal of Housing Economics, 26, pp.1–18. doi:https://doi.org/10.1016/j.jhe.2014.06.003
