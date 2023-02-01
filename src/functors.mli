
(** A module for constructing a 'void' type. *)
module VOID : sig
  val mk : unit -> VOID.t
end

(** A module for constructing a 'unit' type. *)
module UNIT : sig
  val mk : ?ker:VOID.t -> unit -> UNIT.t
end

(** A module for constructing a 'bool' type. *)
module BOOL : sig
  val mk : ?src:VOID.t -> ?tgt:UNIT.t -> unit -> BOOL.t
end

(** A module for constructing a 'node' type. *)
module NODE : sig
  val mk : ?hole:NODE.t -> ?i0:int -> ?i1:int -> ?id:string -> ?orient:BOOL.t -> unit -> NODE.t
end

(** A module for constructing a 'the' type. *)
module THE : sig
  val mk : ?hole:NODE.t -> ?loop:int -> ?comp:string -> ?orient:BOOL.t -> unit -> THE.t
end

(** A module for constructing a 'circle' type. *)
module CIRCLE : sig
  val mk : ?radius:int -> ?center:NODE.t -> ?radian:THE.t -> ?id:string -> ?orient:BOOL.t -> ?parent:CIRCLE.t -> unit -> CIRCLE.t
end

(** A module for constructing a 'disk' type. *)
module DISK : sig
  val mk : ?radius:int -> ?center:NODE.t -> ?radian:THE.t -> ?comp:string -> ?orient:BOOL.t -> ?parent:DISK.t -> unit -> DISK.t
end

(** A module for constructing a 'tree' type. *)
module TREE : sig
  val mk : ?nodes:NODE.t list -> ?edges:THE.t list -> ?id:string -> ?orient:BOOL.t -> unit -> TREE.t
end

(** A module for constructing a 'graph' type. *)
module GRAPH : sig
  val mk : ?edges:CIRCLE.t list -> ?nodes:DISK.t list -> ?comp:string -> ?orient:BOOL.t -> unit -> GRAPH.t
end