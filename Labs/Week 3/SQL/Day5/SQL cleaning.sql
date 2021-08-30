
select * from data_marketing_customer_analysis_round2;

alter table data_marketing_customer_analysis_round2
drop column MyUnknownColumn;

-- Replacing empty values

update data_marketing_customer_analysis_round2
set months_since_last_claim = (select avg(months_since_last_claim))
where months_since_last_claim = "";

update data_marketing_customer_analysis_round2
set number_of_open_complaints = 0
where number_of_open_complaints not in (1.0, 2.0, 3.0, 4.0, 5.0);

ALTER TABLE data_marketing_customer_analysis_round2
CHANGE State state VARCHAR(30),
CHANGE `Customer Lifetime Value` customer_lifetime_value DOUBLE,
CHANGE `Effective To Date` effective_to_date TEXT,
CHANGE `Marital Status` marital_status TEXT,
CHANGE `Monthly Premium Auto` monthly_premium_auto INT,
CHANGE `Months Since Last Claim` months_since_last_claim TEXT,
CHANGE `Months Since Policy Inception` months_since_policy_inception INT,
CHANGE `Number Of Open Complaints` number_of_open_complaints TEXT,
CHANGE `Number of Policies` number_of_policies INT,
CHANGE `Policy Type` policy_type TEXT,
CHANGE `Renew Offer Type` renew_offer_type TEXT,
CHANGE `Sales Channel` sales_channel TEXT,
CHANGE `Total Claim Amount` total_claim_amount DOUBLE,
CHANGE `Vehicle Class` vehicle_class TEXT,
CHANGE `Vehicle Size` vehicle_size TEXT,
CHANGE `Vehicle Type` vehicle_type TEXT;



