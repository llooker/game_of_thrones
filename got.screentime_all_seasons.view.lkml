view: screentime_all_seasons {
  derived_table: {
    sql_trigger_value: select 1 ;;
    sql: SELECT *
          , CASE
              WHEN character = "Petyr 'Littlefinger' Baelish"
                THEN 'Petyr Baelish'
              WHEN character = "Eddard 'Ned' Stark"
                THEN 'Eddard Stark'
              WHEN character = "Catelyn Stark"
                THEN 'Catelyn Tully'
              WHEN character = "Ramsay Stark"
                THEN "Ramsay Snow"
              WHEN character = "Lord Varys"
                THEN "Varys"
              WHEN character = "Sandor 'The Hound' Clegane"
                THEN "Sandor Clegane"
              WHEN character = "Ramsay Bolton"
                THEN "Ramsay Snow"
                WHEN character = "Grand Maester Pycelle"
                THEN "Pycelle"
              WHEN character = "Maester Luwin"
                THEN "Luwin"
              WHEN character = "Maester Aemon"
                THEN "Aemon Targaryen"
              WHEN character = "Gregor 'The Mountain' Clegane"
                THEN "Gregor Clegane"

            ELSE character
            END as character_name
            from  GameOfThrones.screentime_all_seasons ;;

#       persist_for: "24 hours"
    }

  dimension: character_name {
    type: string
    sql: TRIM(${TABLE}.character_name) ;;
  }

  dimension: season_1_raw {
    hidden: yes
    type: string
    sql: ${TABLE}.season_1 ;;
  }

  dimension: season_1_minutes {
    hidden: yes
    type: number
    sql: CAST(RPAD(${season_1_raw}, STRPOS(${season_1_raw}, ":")-1) AS INT64) ;;
  }

  dimension: season_1_seconds {
    hidden: yes
    type: number
    sql: CAST(SUBSTR(${season_1_raw}, STRPOS(${season_1_raw}, ":")-length(${season_1_raw})) AS INT64) ;;
  }

  dimension: season_1_total_seconds_screentime {
    type: number
    sql: (60*${season_1_minutes})+${season_1_seconds} ;;
  }

  dimension: season_1_total_minutes_screentime {
    type: number
    sql: ${season_1_total_seconds_screentime} / 60 ;;
  }

  dimension: season_2_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.season_2 ;;
  }

  dimension: season_2_minutes {
    hidden: yes
    type: number
    sql: CAST(RPAD(${season_2_raw}, STRPOS(${season_2_raw}, ":")-1) AS INT64) ;;
  }

  dimension: season_2_seconds {
    hidden: yes
    type: number
    sql: CAST(SUBSTR(${season_2_raw}, STRPOS(${season_2_raw}, ":")-length(${season_2_raw})) AS INT64) ;;
  }

  dimension: season_2_total_seconds_screentime {
    type: number
    sql: (60*${season_2_minutes})+${season_2_seconds} ;;
  }

  dimension: season_2_total_minutes_screentime {
    type: number
    sql: ${season_2_total_seconds_screentime} / 60 ;;
  }

  dimension: season_3_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.season_3 ;;
  }

  dimension: season_3_minutes {
    hidden: yes
    type: number
    sql: CAST(RPAD(${season_3_raw}, STRPOS(${season_3_raw}, ":")-1) AS INT64) ;;
  }

  dimension: season_3_seconds {
    hidden: yes
    type: number
    sql: CAST(SUBSTR(${season_3_raw}, STRPOS(${season_3_raw}, ":")-length(${season_3_raw})) AS INT64) ;;
  }

  dimension: season_3_total_seconds_screentime {
    type: number
    sql: (60*${season_3_minutes})+${season_3_seconds} ;;
  }

  dimension: season_3_total_minutes_screentime {
    type: number
    sql: ${season_3_total_seconds_screentime} / 60 ;;
  }

  dimension: season_4_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.season_4 ;;
  }

  dimension: season_4_minutes {
    hidden: yes
    type: number
    sql: CAST(RPAD(${season_4_raw}, STRPOS(${season_4_raw}, ":")-1) AS INT64) ;;
  }

  dimension: season_4_seconds {
    hidden: yes
    type: number
    sql: CAST(SUBSTR(${season_4_raw}, STRPOS(${season_4_raw}, ":")-length(${season_4_raw})) AS INT64) ;;
  }

  dimension: season_4_total_seconds_screentime {
    type: number
    sql: (60*${season_4_minutes})+${season_4_seconds} ;;
  }

  dimension: season_4_total_minutes_screentime {
    type: number
    sql: ${season_4_total_seconds_screentime} / 60 ;;
  }

  dimension: season_5_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.season_5 ;;
  }

  dimension: season_5_minutes {
    hidden: yes
    type: number
    sql: CAST(RPAD(${season_5_raw}, STRPOS(${season_5_raw}, ":")-1) AS INT64) ;;
  }

  dimension: season_5_seconds {
    hidden: yes
    type: number
    sql: CAST(SUBSTR(${season_5_raw}, STRPOS(${season_5_raw}, ":")-length(${season_5_raw})) AS INT64) ;;
  }

  dimension: season_5_total_seconds_screentime {
    type: number
    sql: (60*${season_5_minutes})+${season_5_seconds} ;;
  }

  dimension: season_5_total_minutes_screentime {
    type: number
    sql: ${season_5_total_seconds_screentime} / 60 ;;
  }

  dimension: season_6_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.season_6 ;;
  }

  dimension: season_6_minutes {
    hidden: yes
    type: number
    sql: CAST(RPAD(${season_6_raw}, STRPOS(${season_6_raw}, ":")-1) AS INT64) ;;
  }

  dimension: season_6_seconds {
    hidden: yes
    type: number
    sql: CAST(SUBSTR(${season_6_raw}, STRPOS(${season_6_raw}, ":")-length(${season_6_raw})) AS INT64) ;;
  }

  dimension: season_6_total_seconds_screentime {
    type: number
    sql: (60*${season_6_minutes})+${season_6_seconds} ;;
  }

  dimension: season_6_total_minutes_screentime {
    type: number
    sql: ${season_6_total_seconds_screentime} / 60 ;;
  }

  dimension: total_screentime_seconds {
    type: number
    sql: ${season_1_total_seconds_screentime} + ${season_2_total_seconds_screentime}
    + ${season_3_total_seconds_screentime} + ${season_4_total_seconds_screentime} +
    ${season_5_total_seconds_screentime} + ${season_6_total_seconds_screentime};;
  }

  dimension: total_screen_time_minutes {
    type: number
    sql: ${total_screentime_seconds} / 60 ;;
  }


  measure: count {
    type: count
    drill_fields: []
    }

  measure: season_1_total_minutes_max {
    type: max
    sql: ${season_1_total_minutes_screentime} ;;
    }
  measure: season_2_total_minutes_max {
    type: max
    sql: ${season_2_total_minutes_screentime} ;;
    }
  measure: season_3_total_minutes_max {
    type: max
    sql: ${season_3_total_minutes_screentime} ;;
  }
  measure: season_4_total_minutes_max {
    type: max
    sql: ${season_4_total_minutes_screentime} ;;
  }
  measure: season_5_total_minutes_max {
    type: max
    sql: ${season_4_total_minutes_screentime} ;;
  }
  measure: season_6_total_minutes_max {
    type: max
    sql: ${season_6_total_minutes_screentime} ;;
  }


}
