(** Universal Hyperbolic Geometry (UHG) is a dramatically new approach to the classical subject initiated by Gauss, Lobachevsky and Bolyai. 
    While classical hyperbolic geometry is set in the interior of the unit disk, or the upper half plane, 
    UHG involves the entire projective plane, together with a distinguished conic. In this sense it is parallel to Cayley Klein geometry, 
    which calls the distinguished conic the absolute.
    But UHG introduces metrical structure in a purely algebraic way, without use of transcendental 
    functions such as the log or sin, and exactly parallel to rational trigonometry in the plane. 
    That means that projective notions of quadrance between points and spread between lines are the main measurements. 
    Everything becomes much simpler, more beautiful and more general, extending to arbitrary fields (including finite fields!) and also to other quadratic forms.
    And there are many new theorems and insights. Welcome to a new hyperbolic world! *)
(** Mathematical naturality of Cayley Transformations to provide our structure with the mechanics.
    Furthermore, construction ensures that all postprocessed and indexed data structure is locally linear.
    ie. representable and computable by simple matrices and operations of thereof.
    Duals and potential covariants of our planar graph are trees and endomaps.
    Their assignments are reasoned using universality/naturality. *)

(** An empty structure. *)
module type VOID = sig
  type t = { hole : t option; ker : VOID.t }
end

(** A structure with a 'ker' field of type 'void' and a possible structure. *)
module type UNIT = sig
  type t = { hole : t option; ker : VOID.t }
end

module type BOOL = sig
  type t = { source : UNIT.t; sink : VOID.t option }
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

module type TYPE = sig
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

(** pipeline with redprl/{asai,bantorra} *)
(** Use redprl/{mugen,stagedtt} for derivation throughout everywhere *)
(** Simplicial Universes from redprl/yuujinchou *)



(** Inductors from redprl/cooltt *)


(** Recursors from redprl/cooltt *)

(** (Co)Products from redprl/kado *)

(** Algebra from redprl/algae{ff,tt} *)
