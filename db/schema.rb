# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_09_05_235903) do

  create_table "administrators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "media_type"
    t.bigint "media_id"
    t.bigint "person_id"
    t.string "role"
    t.integer "order"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_type", "media_id"], name: "index_credits_on_media_type_and_media_id"
    t.index ["person_id"], name: "index_credits_on_person_id"
  end

  create_table "genres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type", "name"], name: "index_genres_on_type_and_name", unique: true
  end

  create_table "genres_movies", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "genre_id"
    t.bigint "movie_id"
    t.index ["genre_id"], name: "index_genres_movies_on_genre_id"
    t.index ["movie_id"], name: "index_genres_movies_on_movie_id"
  end

  create_table "genres_tv_shows", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "genre_id"
    t.bigint "tv_show_id"
    t.index ["genre_id"], name: "index_genres_tv_shows_on_genre_id"
    t.index ["tv_show_id"], name: "index_genres_tv_shows_on_tv_show_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "media_type"
    t.bigint "media_id"
    t.string "image_type"
    t.string "file_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_type", "media_id"], name: "index_images_on_media_type_and_media_id"
  end

  create_table "movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.integer "tmdb_id"
    t.string "imdb_id"
    t.string "title"
    t.string "tagline"
    t.text "overview"
    t.string "homepage"
    t.string "status"
    t.integer "runtime"
    t.bigint "budget"
    t.bigint "revenue"
    t.date "release_date"
    t.string "poster_path"
    t.string "backdrop_path"
    t.boolean "video"
    t.float "vote_average", default: 0.0
    t.integer "vote_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["release_date"], name: "index_movies_on_release_date"
    t.index ["title", "tagline", "overview"], name: "index_movies_on_title_and_tagline_and_overview", type: :fulltext
    t.index ["title"], name: "index_movies_on_title"
    t.index ["tmdb_id"], name: "index_movies_on_tmdb_id"
    t.index ["vote_average"], name: "index_movies_on_vote_average"
  end

  create_table "people", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.integer "tmdb_id"
    t.string "name"
    t.integer "gender", default: 0
    t.string "profile_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_people_on_name", type: :fulltext
    t.index ["tmdb_id"], name: "index_people_on_tmdb_id"
  end

  create_table "tv_show_seasons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "tv_show_id"
    t.integer "tmdb_id"
    t.integer "number"
    t.string "name"
    t.text "overview"
    t.date "air_date"
    t.integer "episode_count"
    t.string "poster_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tv_show_id"], name: "index_tv_show_seasons_on_tv_show_id"
  end

  create_table "tv_shows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.integer "tmdb_id"
    t.string "name"
    t.text "overview"
    t.string "homepage"
    t.string "status"
    t.date "first_air_date"
    t.date "last_air_date"
    t.string "poster_path"
    t.string "backdrop_path"
    t.float "vote_average", default: 0.0
    t.integer "vote_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "overview"], name: "index_tv_shows_on_name_and_overview", type: :fulltext
    t.index ["name"], name: "index_tv_shows_on_name"
    t.index ["tmdb_id"], name: "index_tv_shows_on_tmdb_id"
    t.index ["vote_average"], name: "index_tv_shows_on_vote_average"
  end

  create_table "videos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "media_type"
    t.bigint "media_id"
    t.string "name"
    t.string "site"
    t.string "key"
    t.string "video_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_type", "media_id"], name: "index_videos_on_media_type_and_media_id"
  end

end
