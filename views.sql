CREATE OR REPLACE VIEW `for_datatable` AS SELECT
cdna.cdna_change AS cdna,
cdna.basenum AS basenum,
cdna.resnum AS resnum,
cdna.variant AS variant,
syngap_domain.domain AS domain,
syngap.consensus AS consensus,
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
prediction_text('revel', cdna.revel_score) AS revel_predict,
ROUND(syngap.deltaMW, 2) AS `deltaMW`,
syngap.deltaHydropathy AS `deltaHydropathy`,
prediction_text('foldx', syngap_structural.foldx_ddG) AS foldx_predict,
syngap_structural.foldx_ddG AS foldx_avg_ddG,
syngap_structural.foldx_stddev AS foldx_stddev,
prediction_text('rosetta', syngap_structural.rosetta_ddG) AS rosetta_predict,
syngap_structural.rosetta_ddG AS rosetta_ddG,
prediction_text('foldetta', syngap_structural.foldetta_ddG) AS foldetta_predict,
syngap_structural.foldetta_ddG AS foldetta_ddG,
prediction_text('premps', syngap_structural.premPS_ddG) AS premPS_predict,
syngap_structural.premPS_ddG AS premPS_ddG,
syngap.provean_score AS provean_score,
prediction_text('provean', syngap.provean_score) AS provean_predict,
prediction_text('pp2_div', syngap.polyPhen2_HumDiv_pph2_prob) AS `polyPhen2_HumDiv_predict`,
syngap.polyPhen2_HumDiv_pph2_prob AS `polyPhen2_HumDiv_pph2_prob`,
prediction_text('pp2_var', syngap.polyPhen2_HumVar_pph2_prob) AS `polyPhen2_HumVar_predict`,
syngap.polyPhen2_HumVar_pph2_prob AS `polyPhen2_HumVar_pph2_prob`,
syngap.SIFT_animal_Predict AS `SIFT_animal_Predict`,
prediction_text('sift', syngap.SIFT_animal_Predict) AS `SIFT_animal_Warnings`,
syngap.SIFT_animal_Conservation AS `SIFT_animal_Conservation`,
syngap.SIFT_animal_Sequences AS `SIFT_animal_Sequences`,
iupred2a.iupred AS `IUPred`,
prediction_text('iupred', iupred2a.iupred) AS `IUPred_predict`,
iupred2a.anchor AS `ANCHOR`,
prediction_text('anchor', iupred2a.anchor) AS `ANCHOR_predict`,
psmutpred.score_ip_rf AS `psmutpred_score_ip_rf`,
psmutpred.score_ip_svr AS `psmutpred_score_ip_svr`,
psmutpred.score_sp_lr AS `psmutpred_score_sp_lr`,
psmutpred.score_sp_rf AS `psmutpred_score_sp_rf`,
psmutpred.rank_ip_rf AS `psmutpred_rank_ip_rf`,
psmutpred.rank_ip_svr AS `psmutpred_rank_ip_svr`,
psmutpred.rank_sp_lr AS `psmutpred_rank_sp_lr`,
psmutpred.rank_sp_rf AS `psmutpred_rank_sp_rf`,
prediction_text('psmutpred_ip', psmutpred.score_ip_rf) AS `psmutpred_ip`,
prediction_text('psmutpred_sp', psmutpred.score_sp_rf) AS `psmutpred_sp`,
mobidb.af_disorder AS `af_disorder`,
mobidb.af_plddt AS `af_plddt`,
mobidb.mobidb_lite_disorder AS `mobidb_lite_disorder`,
phosphositeplus.ltp AS psp_ltp,
phosphositeplus.htp AS psp_htp,
phosphositeplus.psp_id AS psp_id,
phosphositeplus.kl_id AS psp_kl,
phosphositeplus.ptm AS psp_ptm,
syngap.PAM250 AS `PAM250`,
syngap.PAM120 AS `PAM120`,
syngap.ESM1b_Q96PV0_LLRscore AS `ESM1b_Q96PV0_LLRscore`,
prediction_text('esm1b', syngap.ESM1b_Q96PV0_LLRscore) AS `ESM1b_Q96PV0_Prediction`,
syngap.FATHMM_Diseasespecific_Nervous_System_Score AS `FATHMM_Diseasespecific_Nervous_System_Score`,
prediction_text('fathmm', syngap.FATHMM_Diseasespecific_Nervous_System_Score) AS `FATHMM_predict`,
ROUND(syngap.AlphaMissense_Pathogenicity, 3) AS `AlphaMissense_Pathogenicity`,
prediction_text('alphamissense', syngap.AlphaMissense_Pathogenicity) AS `AlphaMissense_Class`,
prediction_text('amissenseopt', syngap.AlphaMissense_Pathogenicity) AS alphamissense_predict,
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
ai_summary.summary AS summary,
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
LEFT JOIN syngap_domain     ON syngap.domainID = syngap_domain.domainID
LEFT JOIN ai_summary        ON cdna.cdna_change = ai_summary.cdna_change
LEFT JOIN iupred2a          ON cdna.resnum = iupred2a.resnum
LEFT JOIN psmutpred         ON cdna.variant = psmutpred.variant
LEFT JOIN mobidb            ON cdna.resnum = mobidb.resnum
LEFT JOIN phosphositeplus   ON cdna.resnum = phosphositeplus.resnum
;

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
syngap.consensus AS SGM_consensus,
cdna.clinvar_uid AS `ClinVar ID`,
clinvar_germline.cv_status AS `ClinVar Status`,
cdna.gnomad_id AS `gnomAD ID`,
syngap.ESM1b_Q96PV0_LLRscore AS `ESM1b (Q96PV0) LLRscore`,
prediction_text('esm1b', syngap.ESM1b_Q96PV0_LLRscore) AS `ESM1b_Q96PV0_predict`,
syngap.AlphaMissense_Pathogenicity AS `AlphaMissense Pathogenicity`,
prediction_text('alphamissense', syngap.AlphaMissense_Pathogenicity) AS `AM_predict`,
prediction_text('amissenseopt', syngap.AlphaMissense_Pathogenicity) AS AM_predict_opt,
cdna.revel_score AS revel_score,
prediction_text('revel', cdna.revel_score) AS revel_predict,
syngap_structural.foldx_ddG AS `FoldX ddG`,
prediction_text('foldx', syngap_structural.foldx_ddG) AS foldx_predict,
syngap_structural.rosetta_ddG AS `Rosetta ddG`,
prediction_text('rosetta', syngap_structural.rosetta_ddG) AS rosetta_predict,
syngap_structural.foldetta_ddG AS `Foldetta ddG`,
prediction_text('foldetta', syngap_structural.foldetta_ddG) AS foldetta_predict,
syngap_structural.premPS_ddG AS `premPS ddG`,
prediction_text('premps', syngap_structural.premPS_ddG) AS premPS_predict,
syngap.provean_score AS `PROVEAN Score`,
prediction_text('provean', syngap.provean_score) AS provean_predict,
syngap.polyPhen2_HumDiv_pph2_prob AS `polyPhen-2 HumDiv pph2_prob`,
prediction_text('pp2_div', syngap.polyPhen2_HumDiv_pph2_prob) AS `pPhen-2_Div_predict`,
syngap.polyPhen2_HumVar_pph2_prob AS `polyPhen-2 HumVar pph2_prob`,
prediction_text('pp2_var', syngap.polyPhen2_HumVar_pph2_prob) AS `pPhen-2_Var_predict`,
syngap.FATHMM_Diseasespecific_Nervous_System_Score AS `FATHMM Nervous System Score`,
prediction_text('fathmm', syngap.FATHMM_Diseasespecific_Nervous_System_Score) AS `FATHMM_predict`,
syngap.SIFT_animal_Predict AS `SIFT Prediction`,
prediction_text('sift', syngap.SIFT_animal_Predict) AS `SIFT_predict`,
iupred2a.iupred AS `IUPred`,
iupred2a.anchor AS `ANCHOR`,
psmutpred.score_ip_rf AS `psmutpred_score_ip_rf`,
psmutpred.score_ip_svr AS `psmutpred_score_ip_svr`,
psmutpred.score_sp_lr AS `psmutpred_score_sp_lr`,
psmutpred.score_sp_rf AS `psmutpred_score_sp_rf`,
psmutpred.rank_ip_rf AS `psmutpred_rank_ip_rf`,
psmutpred.rank_ip_svr AS `psmutpred_rank_ip_svr`,
psmutpred.rank_sp_lr AS `psmutpred_rank_sp_lr`,
psmutpred.rank_sp_rf AS `psmutpred_rank_sp_rf`,
mobidb.af_disorder AS `af_disorder`,
mobidb.af_plddt AS `af_plddt`,
mobidb.mobidb_lite_disorder AS `mobidb_lite_disorder`,
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
LEFT JOIN clinvar           ON cdna.clinvar_uid = clinvar.uid
LEFT JOIN clinvar_germline  ON clinvar.germline_desc = clinvar_germline.cv_description
LEFT JOIN iupred2a          ON cdna.resnum = iupred2a.resnum
LEFT JOIN psmutpred         ON cdna.variant = psmutpred.variant
LEFT JOIN mobidb            ON cdna.resnum = mobidb.resnum
ORDER BY cdna.basenum,cdna.variant ASC;
