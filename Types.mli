(** Mathematical naturality of Cayley Transformations to provide our structure with the mechanics.
    Furthermore, construction ensures that all postprocessed and indexed data structure is locally linear.
    ie. representable and computable by simple matrices and operations of thereof.
    Duals and potential covariants of our planar graph are trees and their maps.
    Their assignments were reasoned with naturality. *)

(** An empty structure. *)
module type VOID = sig end

(** A structure with a possible 'ker' field of type 'void'. *)
module type UNIT = sig
  type t = { ker : VOID.t option }
end

module type BOOL = sig
  type t = { src : VOID.t option; tgt : UNIT.t }
end

module type NODE = sig
  type t = {
    hole : t option;
    i0 : int option;
    i1 : int option;
    id : string option;
    orient : BOOL.t option;
  }
end

module type THE = sig
  type t = {
    hole : NODE.t option;
    loop : int option;
    comp : string option;
    orient : BOOL.t option;
  }
end

module type CIRCLE = sig
  type t = {
    radius : int option;
    center : NODE.t;
    radian : THE.t;
    id : string option;
    orient : BOOL.t option;
    parent : CIRCLE.t option;
  }
end

module type DISK = sig
  type t = {
    radius : int option;;
    center : NODE.t;
    radian : THE.t;
    comp : string option;
    orient : BOOL.t option;
    parent : DISK.t option;
  }
end



module type TREE = sig
  type t = {
    nodes : NODE.t list option;
    edges : THE.t list option;
    id : string option;
    orient : BOOL.t option;
  }
end

module type GRAPH = sig
  type t = {
    edges : CIRCLE.t list option;
    nodes : DISK.t list option;
    comp : string option;
    orient : BOOL.t option;
  }
end



module type SIG = sig
  type t
  val id : t
  val ( % ) : t -> t -> t
end

module type SIG2 = sig
  type 'a t
  val id : 'a t
  val ( % ) : 'a t -> 'a t -> 'a t
end


module type CAT = sig
  type t
  type hom
  val comp : hom -> hom -> hom
  val id : obj -> hom
end

module type FUNCTOR = sig
  type 'a t
  val ap : ('a -> 'b) -> 'a t -> 'b t
end


module type MONAD = sig
  type t
  type hom
  val comp : hom -> hom -> hom
  val id : obj -> hom
end

module type TYPE = sig
  type t
  type hom
  val comp : hom -> hom -> hom
  val id : obj -> hom
end

module type SET = sig
  type t
  type hom
  val comp : hom -> hom -> hom
  val id : obj -> hom
end

module type GROUP = sig
  type t
  type hom
  val comp : hom -> hom -> hom
  val id : obj -> hom
end

module type RING = sig
  type t
  type hom
  val comp : hom -> hom -> hom
  val id : obj -> hom
end

module type FIELD = sig
  type t
  type hom
  val comp : hom -> hom -> hom
  val id : obj -> hom
end

module type VECTOR = sig
  type t
  type hom
  val comp : hom -> hom -> hom
  val id : obj -> hom
end

module type MODULE = sig
  type t
  type hom
  val comp : hom -> hom -> hom
  val id : obj -> hom
end

module type BIMODULE = sig
  type t
  type hom
  val comp : hom -> hom -> hom
  val id : obj -> hom
end

module type RIGID = sig
  type t
  type hom
  val comp : hom -> hom -> hom
  val id : obj -> hom
end

module type SEMIRIGID = sig
  type t
  type hom
  val comp : hom -> hom -> hom
  val id : obj -> hom
end

(** pipeline with redprl/{asai,bantorra} *)
(** Use redprl/{mugen,stagedtt} for derivation throughout everywhere *)
(** Simplicial Universes from redprl/yuujinchou *)



(** Inductors from redprl/cooltt *)


(** Recursors from redprl/cooltt *)

(** (Co)Products from redprl/kado *)

(** Algebra from redprl/algae{ff,tt} *)
