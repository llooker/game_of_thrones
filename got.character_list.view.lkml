view: character_list {
  sql_table_name: GameOfThrones.character_death ;;

  dimension: member_of_house {
    type: string
    sql: CASE WHEN ${TABLE}.Allegiances LIKE '%House%' THEN LTRIM(SUBSTR(${TABLE}.Allegiances, LENGTH("House "), LENGTH(${TABLE}.Allegiances))) END ;;
  }

  dimension: allegiances {
    type: string
    sql: ${TABLE}.Allegiances ;;
  }

  dimension: total_house_allegiance {
    type: string
    sql: CASE WHEN ${TABLE}.Allegiances LIKE '%House%' THEN LTRIM(SUBSTR(${TABLE}.Allegiances, LENGTH("House "), LENGTH(${TABLE}.Allegiances))) ELSE LTRIM(${TABLE}.Allegiances) END ;;
  }

  dimension: book_intro_chapter {
    type: number
    sql: ${TABLE}.Book_Intro_Chapter ;;
  }

  dimension: book_of_death {
    type: number
    sql: ${TABLE}.Book_of_Death ;;
  }

  dimension: clash_of_kings {
    type: number
    sql: ${TABLE}.CoK ;;
  }

  dimension: death_chapter {
    type: number
    sql: ${TABLE}.Death_Chapter ;;
  }

  dimension: death_year {
    type: number
    sql: ${TABLE}.Death_Year ;;
  }

  dimension: dance_with_dragons {
    type: number
    sql: ${TABLE}.DwD ;;
  }

  dimension: feast_for_crows {
    type: number
    sql: ${TABLE}.FfC ;;
  }

  dimension: gender {
    type: string
    case: {
      when: {
        sql: ${TABLE}.Gender = 1 ;;
        label: "Male"
      }
      when: {
        sql: ${TABLE}.Gender = 0 ;;
        label: "Female"
      }
      else: "Not Specified"

    }
  }

  dimension: game_of_thrones {
    type: number
    sql: ${TABLE}.GoT ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
    primary_key: yes
  }

  dimension: nobility {
    type: number
    sql: ${TABLE}.Nobility ;;
  }

  dimension: so_s {
    type: number
    sql: ${TABLE}.SoS ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
