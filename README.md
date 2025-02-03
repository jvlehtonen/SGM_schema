# SGM_schema
Schema for MariaDB database that has pathogenicity predictions for a gene

The 'cdna' could be considered the main table; one entry per unique c.dna change (aka HGVSc).
Each c.dna change may have data in ClinVar and gnomAD databases. A 'variant' is observed change
in protein sequence (HGVSp) that affects how the change affects protein.

The 'syngap' and 'syngap_structural' tables hold collected or computed predictions about variants.
The name "syngap" is due to the schema being created originally to store data for SYNGAP1 gene
(synaptic Ras GTPase activating protein 1).


```
+----------------------+
| Tables_in_syngap     |
+----------------------+
| aminoacids           |
| cdna                 |
| clinvar              |
| clinvar_germline     |
| clinvar_review       |
| gnomAD               |
| predictions          |
| syngap               |
| syngap_domain        |
| syngap_sa            |
| syngap_structural    |
| syngap_verdict       |
+----------------------+
```
The aminoacids, clinvar_germline, clinvar_review, predictions, syngap_domain, and syngap_verdict are (code->text) lookup tables.

```
+----------------------+
| Views_in_syngap      |
+----------------------+
| HGVSp_to_variant     |
| cdna_count           |
| for_HGVSp_to_variant |
| for_csv              |
| for_datatable        |
+----------------------+
```
The for_csv and for_datatable are views that combine/collect data for single CSV table and for display on SGM website, respectively.

```mermaid
erDiagram
    clinvar ||--o| cdna : ""
    gnomAD ||--o| cdna : ""
    cdna }|--|| syngap : ""
    cdna }|--o| syngap_structural : ""
    cdna }|--o| syngap_sa : ""
    clinvar{
        int uid PK
    }
    gnomAD{
        string id PK
    }
    cdna{
        string cdna_change PK
        int basenum
        string variant
        int resnum
        int clinvar_uid
        string gnomad_id
    }
    syngap{
        string variant PK
    }
    syngap_structural{
        string variant PK
    }
    syngap_sa{
        string variant PK
    }
```

## Installation
* 'tables.sql' has the tables
* 'functions.sql' adds functions that create verbal predictions for scores
* 'views.sql' adds views/queries that combine columns for "single tables".
  Views depend on functions and tables

Create preferably two SQL users, one with write access and second with read-only.
Use the first for content updates and the second on website that shows content to public.
