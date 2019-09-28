(load "index:parse-rss")

(def xml (/urlContentsWithCache "https://news.ycombinator.com/rss"))

(def top-links (take 5 (:items (parse-rss xml))))
(def n 0)

(joinln (map #(str (padLeft (incf n) 2) ". " (:title %) "\n    " (:link %) "\n") top-links ))
