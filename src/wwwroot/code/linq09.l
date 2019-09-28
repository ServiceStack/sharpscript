(let ( (words ["aPPLE" "BlUeBeRrY" "cHeRry"]) )
    (doseq (ul (map #(it { :lower (lower-case %) :upper (upper-case %) } ) words))
    (println "Uppercase: " (:upper ul) ", Lowercase: " (:lower ul))))