(include-book "exec")
(include-book "env")

(env/exec (mk-env-op "6002600301600901"))

;; (env/exec
;;  (mk-env-op
;;   (concatenate 'string
;;                "6060604052361560275760e060020a600035046341c0e1b58114606e578063e"
;;                "5225381146096575b60d56000341115606c57346060908152605890600160a0"
;;                "60020a033316907f90890809c654f11d6e72a28fa60149770a0d11ec6c92319"
;;                "d6ceb2bb0a4ea1a1590602090a35b565b60d5600054600160a060020a039081"
;;                "1633919091161415606c57600054600160a060020a0316ff5b60d5600054600"
;;                "160a060020a0390811633919091161415606c5760008054600160a060020a03"
;;                "9081169190301631606082818181858883f15050505050565b00")))

;; contract SimpleStorage {
;;   uint storedData;
;;   function set(uint x) {
;;     storedData = x;
;;   }
;;   function get() constant returns (uint retVal) {
;;     return storedData;
;;   }
;; }
;; Contract registration:
;; (env/exec
;;  (mk-env-op
;;   (concatenate 'string
;;                "6060604052341561000f57600080fd5b60d38061001d6000396000f3006060"
;;                "604052600436106049576000357c0100000000000000000000000000000000"
;;                "000000000000000000000000900463ffffffff16806360fe47b114604e5780"
;;                "636d4ce63c14606e575b600080fd5b3415605857600080fd5b606c60048080"
;;                "359060200190919050506094565b005b3415607857600080fd5b607e609e56"
;;                "5b6040518082815260200191505060405180910390f35b8060008190555050"
;;                "565b600080549050905600a165627a7a72305820e1f98c821c12eea52047d7"
;;                "324b034ddccc41eaa7365d369b34580ab73c71a8940029")))

;; Contract being registered:
(env/exec
 (mk-env-op
  (concatenate 'string
               "6060604052600436106049576000357c010000000000000000000000000000"
               "0000000000000000000000000000900463ffffffff16806360fe47b114604e"
               "5780636d4ce63c14606e575b600080fd5b3415605857600080fd5b606c6004"
               "8080359060200190919050506094565b005b3415607857600080fd5b607e60"
               "9e565b6040518082815260200191505060405180910390f35b806000819055"
               "5050565b600080549050905600a165627a7a72305820e1f98c821c12eea520"
               "47d7324b034ddccc41eaa7365d369b34580ab73c71a8940029")))


;; Deed contract runtime opcode
;; https://github.com/ethereum/ens/blob/f3334337083728728da56824a5d0a30a8712b60c/HashRegistrarSimplified.sol#L25
(env/exec
 (mk-env-op
  (concatenate 'string
               "60606040526004361061008e576000357c0100000000000000000000000000"
               "000000000000000000000000000000900463ffffffff16806305b344101461"
               "00905780630b5ab3d5146100b957806313af4035146100ce5780632b20e397"
               "146101075780638da5cb5b1461015c578063bbe42771146101b1578063faab"
               "9d39146101d4578063fb1669ca1461020d575b005b341561009b57600080fd"
               "5b6100a3610225565b6040518082815260200191505060405180910390f35b"
               "34156100c457600080fd5b6100cc61022b565b005b34156100d957600080fd"
               "5b610105600480803573ffffffffffffffffffffffffffffffffffffffff16"
               "9060200190919050506102d8565b005b341561011257600080fd5b61011a61"
               "03da565b604051808273ffffffffffffffffffffffffffffffffffffffff16"
               "73ffffffffffffffffffffffffffffffffffffffff16815260200191505060"
               "405180910390f35b341561016757600080fd5b61016f6103ff565b60405180"
               "8273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffff"
               "ffffffffffffffffffffffffff16815260200191505060405180910390f35b"
               "34156101bc57600080fd5b6101d26004808035906020019091905050610425"
               "565b005b34156101df57600080fd5b61020b600480803573ffffffffffffff"
               "ffffffffffffffffffffffffff16906020019091905050610559565b005b61"
               "022360048080359060200190919050506105f7565b005b60015481565b6002"
               "60149054906101000a900460ff161561024557600080fd5b60026000905490"
               "6101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffff"
               "ffffffffffffffffffffffffffffffffffff166108fc3073ffffffffffffff"
               "ffffffffffffffffffffffffff163190811502906040516000604051808303"
               "81858888f19350505050156102d35761dead73ffffffffffffffffffffffff"
               "ffffffffffffffff16ff5b600080fd5b6000809054906101000a900473ffff"
               "ffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffff"
               "ffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffff"
               "ff1614151561033357600080fd5b80600260006101000a81548173ffffffff"
               "ffffffffffffffffffffffffffffffff021916908373ffffffffffffffffff"
               "ffffffffffffffffffffff1602179055507fa2ea9883a321a3e97b8266c2b0"
               "78bfeec6d50c711ed71f874a90d500ae2eaf3681604051808273ffffffffff"
               "ffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffff"
               "ffffffffffff16815260200191505060405180910390a150565b6000809054"
               "906101000a900473ffffffffffffffffffffffffffffffffffffffff168156"
               "5b600260009054906101000a900473ffffffffffffffffffffffffffffffff"
               "ffffffff1681565b6000809054906101000a900473ffffffffffffffffffff"
               "ffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffff"
               "ff163373ffffffffffffffffffffffffffffffffffffffff16141515610480"
               "57600080fd5b600260149054906101000a900460ff16151561049b57600080"
               "fd5b6000600260146101000a81548160ff02191690831515021790555061de"
               "ad73ffffffffffffffffffffffffffffffffffffffff166108fc6103e83073"
               "ffffffffffffffffffffffffffffffffffffffff1631846103e80302811515"
               "6104fc57fe5b049081150290604051600060405180830381858888f1935050"
               "5050151561052257600080fd5b7fbb2ce2f51803bba16bc85282b47deeea9a"
               "5c6223eabea1077be696b3f265cf1360405160405180910390a16105566102"
               "2b565b50565b6000809054906101000a900473ffffffffffffffffffffffff"
               "ffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16"
               "3373ffffffffffffffffffffffffffffffffffffffff161415156105b45760"
               "0080fd5b806000806101000a81548173ffffffffffffffffffffffffffffff"
               "ffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff"
               "16021790555050565b6000809054906101000a900473ffffffffffffffffff"
               "ffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffff"
               "ffff163373ffffffffffffffffffffffffffffffffffffffff161415156106"
               "5257600080fd5b600260149054906101000a900460ff16151561066d576000"
               "80fd5b803073ffffffffffffffffffffffffffffffffffffffff1631101561"
               "069157600080fd5b600260009054906101000a900473ffffffffffffffffff"
               "ffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffff"
               "ffff166108fc823073ffffffffffffffffffffffffffffffffffffffff1631"
               "039081150290604051600060405180830381858888f1935050505015156107"
               "0c57600080fd5b505600a165627a7a7230582099b524f367ac8f6d64a5b0de"
               "ae6fb395bb563d711c6ed83685ea7c6352aa3bdd0029")))
