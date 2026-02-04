(ns interest-is-interesting)

(defn interest-rate
  "Returns the interest rate based on the specified balance."
  [balance]
  (cond
    (>= balance 5000M) 2.475
    (>= balance 1000M) 1.621
    (>= balance 0M) 0.5
    :else -3.213))

(defn annual-balance-update
  "Returns the annual balance update, taking into account the interest rate."
  [balance]
  (-> (interest-rate balance)
      bigdec
      abs
      (* balance)
      (/ 100M)
      (+ balance)
      bigdec))

(annual-balance-update 0)

(defn amount-to-donate
  "Returns how much money to donate based on the balance and the tax-free percentage."
  [balance tax-free-percentage]
  (cond
    (> (annual-balance-update balance) 0)
    (int (* balance tax-free-percentage 0.02))
    :else 0))
