(** Mathematical naturality of Cayley Transformations to provide our structure with the mechanics.
    Furthermore, construction ensures that all postprocessed and indexed data structure is locally linear.
    ie. representable and computable by simple matrices and operations of thereof.
    Duals and potential covariants of our planar graph are trees and their maps.
    Their assignments were reasoned with naturality. *)

module type SIG = sig
  type t
  val id : t
  val ( % ) : t -> t -> t
end

(** An empty structure. *)
module VOID : sig end

(** A structure with a possible 'ker' field of type 'void'. *)
module UNIT : sig
  type t = { ker : VOID.t option }
end

module BOOL : sig
  type t = { src : VOID.t option; tgt : UNIT.t }
end

module NODE : sig
  type t = {
    hole : t option;
    i0 : int option;
    i1 : int option;
    id : string option;
    orient : BOOL.t option;
  }
end

module THE : sig
  type t = {
    hole : NODE.t option;
    loop : int option;
    comp : string option;
    orient : BOOL.t option;
  }
end

module CIRCLE : sig
  type t = {
    radius : int option;
    center : NODE.t;
    radian : THE.t;
    id : string option;
    orient : BOOL.t option;
    parent : CIRCLE.t option;
  }
end

module DISK : sig
  type t = {
    radius : int option;;
    center : NODE.t;
    radian : THE.t;
    comp : string option;
    orient : BOOL.t option;
    parent : DISK.t option;
  }
end



module TREE : sig
  type t = {
    nodes : NODE.t list option;
    edges : THE.t list option;
    id : string option;
    orient : BOOL.t option;
  }
end

module GRAPH : sig
  type t = {
    edges : CIRCLE.t list option;
    nodes : DISK.t list option;
    comp : string option;
    orient : BOOL.t option;
  }
end

(** pipeline with redprl/{asai,bantorra} *)
(** Use redprl/{mugen,stagedtt} for derivation throughout everywhere *)
(** Simplicial Universes from redprl/yuujinchou *)

module type CAT = sig
  type obj
  type hom
  val compose : hom -> hom -> hom
  val id : obj -> hom
end



(** Inductors from redprl/cooltt *)


(** Recursors from redprl/cooltt *)

(** (Co)Products from redprl/kado *)

(** Algebra from redprl/algae{ff,tt} *)

module type FUNCTOR = sig
  type 'a t
  val ap : ('a -> 'b) -> 'a t -> 'b t
end