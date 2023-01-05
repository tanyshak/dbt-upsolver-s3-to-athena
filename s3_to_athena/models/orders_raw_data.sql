SELECT *
FROM
CREATE SYNC JOB {{ this }}
    CONTENT_TYPE = JSON
    AS COPY FROM S3 {{ ref(‘s3_connection’) }} BUCKET = 'upsolver-samples'
PREFIX = 'orders/'
