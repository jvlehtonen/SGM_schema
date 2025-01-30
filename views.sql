CREATE OR REPLACE VIEW `for_datatable` AS SELECT
cdna.cdna_change AS cdna,
cdna.basenum AS basenum,
cdna.resnum AS resnum,
cdna.variant AS variant,
syngap_domain.domain AS domain,
#
cdna.clinvar_uid AS clinvar_uid,
IFNULL(clinvar_germline.cv_rank, 99) AS cv_rank,
clinvar_review.stars AS cv_review,
clinvar.scv_count AS cv_submissions,
clinvar_germline.cv_status AS cv_status,
#
cdna.gnomad_id AS gnomAD_id,
gnomAD.allele_count AS allele_count,
gnomAD.allele_freq AS allele_freq,
#
cdna.revel_score AS revel_score,
revel_prediction(1000*cdna.revel_score) AS revel_predict,
ROUND(syngap.deltaMW, 2) AS `deltaMW`,
syngap.deltaHydropathy AS `deltaHydropathy`,
foldx_prediction(100*syngap_structural.foldx_ddG) AS foldx_predict,
syngap_structural.foldx_ddG AS foldx_avg_ddG,
syngap_structural.foldx_stddev AS foldx_stddev,
rosetta_prediction(100*syngap_structural.rosetta_ddG) AS rosetta_predict,
syngap_structural.rosetta_ddG AS rosetta_ddG,
foldetta_prediction(100*syngap_structural.foldetta_ddG) AS foldetta_predict,
syngap_structural.foldetta_ddG AS foldetta_ddG,
premps_prediction(100*syngap_structural.premPS_ddG) AS premPS_predict,
syngap_structural.premPS_ddG AS premPS_ddG,
syngap.provean_score AS provean_score,
provean_prediction(100*syngap.provean_score) AS provean_predict,
syngap.polyPhen2_HumDiv_predict AS `polyPhen2_HumDiv_predict`,
syngap.polyPhen2_HumDiv_pph2_prob AS `polyPhen2_HumDiv_pph2_prob`,
syngap.polyPhen2_HumVar_predict AS `polyPhen2_HumVar_predict`,
syngap.polyPhen2_HumVar_pph2_prob AS `polyPhen2_HumVar_pph2_prob`,
syngap.SIFT_animal_Predict AS `SIFT_animal_Predict`,
syngap.SIFT_animal_Warnings AS `SIFT_animal_Warnings`,
syngap.SIFT_animal_Conservation AS `SIFT_animal_Conservation`,
syngap.SIFT_animal_Sequences AS `SIFT_animal_Sequences`,
syngap.PAM250 AS `PAM250`,
syngap.PAM120 AS `PAM120`,
syngap.ESM1b_Q96PV0_LLRscore AS `ESM1b_Q96PV0_LLRscore`,
syngap.ESM1b_Q96PV0_Prediction AS `ESM1b_Q96PV0_Prediction`,
syngap.FATHMM_Diseasespecific_Nervous_System_Score AS `FATHMM_Diseasespecific_Nervous_System_Score`,
syngap.AlphaMissense_Pathogenicity AS `AlphaMissense_Pathogenicity`,
syngap.AlphaMissense_Class AS `AlphaMissense_Class`,
alphamissense_prediction(1000*syngap.AlphaMissense_Pathogenicity) AS alphamissense_predict,
syngap_sa.sasa_average AS `sasa_average`,
syngap_sa.sasa_delta AS `sasa_delta`,
syngap_sa.Bfactor_backbone_delta AS `Bfactor_backbone_delta`,
syngap_sa.Bfactor_backbone_stddev AS `Bfactor_backbone_stddev`,
syngap_sa.Bfactor_sidechain_delta AS `Bfactor_sidechain_delta`,
syngap_sa.Bfactor_sidechain_stddev AS `Bfactor_sidechain_stddev`,
syngap_sa.SA_Secondary AS `SA_Secondary`,
syngap_sa.SA_Tertiary AS `SA_Tertiary`,
syngap_sa.SA_Buried AS `SA_Buried`,
syngap_sa.SA_GAP_Ras_interface AS `SA_GAP_Ras_interface`,
syngap_sa.SA_Membrane_interface AS `SA_Membrane interface`,
syngap_sa.SA_Benign AS `SA_Benign`,
syngap_sa.Alert AS `Alert`,
syngap_sa.verdictID AS `verdictID`,
syngap_verdict.verdict AS `verdict`,
syngap_sa.description AS `description`,
syngap.structure AS `structure`,
syngap.doi AS `doi`
FROM cdna
LEFT JOIN clinvar           ON cdna.clinvar_uid = clinvar.uid
LEFT JOIN clinvar_review    ON clinvar.review_status = clinvar_review.status
LEFT JOIN clinvar_germline  ON clinvar.germline_desc = clinvar_germline.cv_description
LEFT JOIN gnomAD            ON cdna.gnomad_id  = gnomAD.id
LEFT JOIN syngap            ON cdna.variant  = syngap.variant
LEFT JOIN syngap_structural ON cdna.variant = syngap_structural.variant
LEFT JOIN syngap_sa         ON cdna.variant  = syngap_sa.variant
LEFT JOIN syngap_verdict    ON syngap_sa.verdictID = syngap_verdict.verdictID
LEFT JOIN syngap_domain     ON syngap.domainID = syngap_domain.domainID ;

CREATE OR REPLACE VIEW `for_HGVSp_to_variant` AS SELECT
HGVSp,
SUBSTRING( HGVSp, 3, 3 ) AS src,
SUBSTRING( HGVSp, LENGTH(HGVSp)-2 ) AS dst,
SUBSTRING( HGVSp, 6, LENGTH(HGVSp)-8 ) AS resnum
FROM cdna ORDER BY basenum, HGVSp ASC;

CREATE OR REPLACE VIEW `HGVSp_to_variant` AS SELECT
HGVSp,
CONCAT(srcaa.one, resnum, dstaa.one) AS variant
FROM for_HGVSp_to_variant
JOIN aminoacids AS srcaa ON srcaa.three = src
JOIN aminoacids AS dstaa ON dstaa.three = dst;

CREATE OR REPLACE VIEW `cdna_count` AS SELECT
variant, count(variant) AS x FROM cdna GROUP BY variant;

CREATE OR REPLACE VIEW `for_csv` AS SELECT
cdna.cdna_change AS cdna,
cdna.variant AS Variant,
syngap_domain.domain AS Domain,
cdna.clinvar_uid AS `ClinVar ID`,
cdna.gnomad_id AS `gnomAD ID`,
syngap.ESM1b_Q96PV0_LLRscore AS `ESM1b (Q96PV0) LLRscore`,
syngap.AlphaMissense_Pathogenicity AS `AlphaMissense Pathogenicity`,
cdna.revel_score AS revel_score,
syngap_structural.foldx_ddG AS `FoldX ddG`,
syngap_structural.rosetta_ddG AS `Rosetta ddG`,
syngap_structural.foldetta_ddG AS `Foldetta ddG`,
syngap_structural.premPS_ddG AS `premPS ddG`,
syngap.provean_score AS `PROVEAN Score`,
syngap.polyPhen2_HumDiv_pph2_prob AS `polyPhen-2 HumDiv pph2_prob`,
syngap.polyPhen2_HumDiv_predict AS `polyPhen-2 HumDiv predict`,
syngap.polyPhen2_HumVar_pph2_prob AS `polyPhen-2 HumVar pph2_prob`,
syngap.polyPhen2_HumVar_predict AS `polyPhen-2 HumVar predict`,
syngap.FATHMM_Diseasespecific_Nervous_System_Score AS `FATHMM Nervous System Score`,
syngap.SIFT_animal_Predict AS `SIFT Prediction`,
syngap.SIFT_animal_Warnings AS `SIFT Status`,
syngap.PAM250 AS `PAM250`,
syngap.PAM120 AS `PAM120`,
syngap.deltaHydropathy AS `dHydropathy`,
ROUND(syngap.deltaMW, 2) AS `dMW`,
syngap_sa.sasa_average AS `average SASA`,
syngap_sa.sasa_delta AS `dSASA`,
syngap_sa.Bfactor_backbone_delta AS `d B-factor backbone`,
syngap_sa.Bfactor_backbone_stddev AS `StdDev B-factor backbone`,
syngap_sa.Bfactor_sidechain_delta AS `d B-factor sidechain`,
syngap_sa.Bfactor_sidechain_stddev AS `StdDev B-factor sidechain`,
syngap_sa.SA_Secondary AS `SA Secondary`,
syngap_sa.SA_Tertiary AS `SA Tertiary bonds`,
syngap_sa.SA_Buried AS `SA Inside out`,
syngap_sa.SA_GAP_Ras_interface AS `SA GAP-Ras interface`,
syngap_sa.SA_Membrane_interface AS `SA At membrane`,
syngap_sa.SA_Benign AS `SA No effect`,
syngap_sa.Alert AS `SA MD Alert`,
syngap_verdict.verdict AS `SA Verdict`,
syngap_sa.description AS `SA Description`,
syngap.doi AS `DOI`
FROM cdna
LEFT JOIN syngap            ON cdna.variant  = syngap.variant
LEFT JOIN syngap_structural ON cdna.variant = syngap_structural.variant
LEFT JOIN syngap_sa         ON cdna.variant  = syngap_sa.variant
LEFT JOIN syngap_verdict    ON syngap_sa.verdictID = syngap_verdict.verdictID
LEFT JOIN syngap_domain     ON syngap.domainID = syngap_domain.domainID
ORDER BY cdna.basenum,cdna.variant ASC;
