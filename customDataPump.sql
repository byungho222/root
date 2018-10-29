
-- @db   Oracle
-- @desc Excel에 담긴 Data를 DDL 없이 테이블 형식으로 만든다.
--       (DDL 리퀘스트 하기가 번거로워서)
SELECT
    SUBSTR( COLUMN_VALUE, 1, INSTR(COLUMN_VALUE, '|') - 1 ) AS KEYWORD,
    SUBSTR( COLUMN_VALUE, INSTR(COLUMN_VALUE, '|') + 1, LENGTH(COLUMN_VALUE) ) AS URL,
FROM
    TABLE (
      F_ARRAY_TO_RECORD('
        ChamaMS|https://prod.spotlight-education.com/v-Qo6gg772wu.mp4,  --sheet의 데이터를 단순히 String으로 가공하였음
        CCES|https://prod.spotlight-education.com/v-3uT1hlqckj.mp4
      ', ',')
    );
