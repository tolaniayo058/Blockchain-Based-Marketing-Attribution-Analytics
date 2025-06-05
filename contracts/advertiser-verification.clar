;; Advertiser Verification Contract
;; Validates marketing advertisers on the blockchain

(define-data-var admin principal tx-sender)

;; Map to store verified advertisers
(define-map verified-advertisers principal bool)

;; Error codes
(define-constant ERR-NOT-AUTHORIZED u100)
(define-constant ERR-ALREADY-VERIFIED u101)
(define-constant ERR-NOT-FOUND u102)

;; Check if caller is admin
(define-private (is-admin)
  (is-eq tx-sender (var-get admin)))

;; Verify an advertiser
(define-public (verify-advertiser (advertiser principal))
  (begin
    (asserts! (is-admin) (err ERR-NOT-AUTHORIZED))
    (asserts! (is-none (map-get? verified-advertisers advertiser)) (err ERR-ALREADY-VERIFIED))
    (ok (map-set verified-advertisers advertiser true))))

;; Revoke verification
(define-public (revoke-verification (advertiser principal))
  (begin
    (asserts! (is-admin) (err ERR-NOT-AUTHORIZED))
    (asserts! (is-some (map-get? verified-advertisers advertiser)) (err ERR-NOT-FOUND))
    (ok (map-delete verified-advertisers advertiser))))

;; Check if an advertiser is verified
(define-read-only (is-verified (advertiser principal))
  (default-to false (map-get? verified-advertisers advertiser)))

;; Transfer admin rights
(define-public (transfer-admin (new-admin principal))
  (begin
    (asserts! (is-admin) (err ERR-NOT-AUTHORIZED))
    (ok (var-set admin new-admin))))
