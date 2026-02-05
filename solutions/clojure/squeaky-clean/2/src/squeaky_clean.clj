(ns squeaky-clean
  (:require [clojure.string :as str]))

(defn capital-first-letter
  "This function only turns the first letter to capital,
  without changing any other letter in the word"
  [s]
  (->> (map-indexed #(if (= %1 0)
                       (Character/toUpperCase %2)
                       %2) s)
       (apply str)))

(defn clean
  "Helps clean up the string"
  [s]
  (as-> s input
    (str/replace input " " "_")
    (str/replace input #"[\u0000-\u001F\u007F-\u009F]" "CTRL")
    (str/split input #"-")
    (map-indexed #(if (> %1 0)
                    (squeaky-clean/capital-first-letter %2)
                    %2)
                 input)
    (apply str input)
    (filter #(or (= % \_)
                 (Character/isLetter %))
            input)
    (apply str input)
    (str/replace input #"[α-ω]" "")))
