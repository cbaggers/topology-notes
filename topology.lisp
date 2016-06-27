;; metric space

;; (X . d) when x is a set and d is a metric

;; open ball
;; Bᵣ(c) balls of radius r where c ∈ X (c is in the set x)
;; Bᵣ(c) = { x ∈ X: d(c,x) < r }
;; ^^ the set of x in X which are less than r
;; open as it doesnt include the values on the line
;; we just get asimtopically close

(let* ((s (metric-space ℝ² #'metric-max)))
  (∈ s #'< 1))

;; Open sets
;; All open balls are open sets but there are more open sets than just the
;; open balls.
;;
;; given U ⊆ X (⊂ is 'proper subset' so cant be all of the space
;;              ⊆ is 'subset' and can include all the space)
;; U is open if ∀x ∈ U, ∃r > 0 s.t Bᵣ(x) ⊆ U
;; U is open if for all x in U there is an open ball around it that is in
;; the set U.
;;
;; Note no matter how close the the boundary of U there must be a open ball


;; continuity at a point (video 6)
;; given 2 metric spaces (X,d) (Y, d')
;; and a function f: x -> y (function from domain x to codomain y)
;; then
;; f is 'continuous at c' if ∀ε>0, ∃ a>0 s.t f(Bₐ(c)) ⊆ Bε (f(c))
;; f is a continuous function if for all positive radius ε there exists another
;; positive radius 'a' such that we can take a  ball of radius 'a' around the
;; point c and squeeze it inside a ball of radius ε around f(c)
;;
;; so we pick an arbitrary ball in the codomain around a point c and then if we
;; can find a ball in the domain such that passing it through the function gives
;; us a ball in the codomain that is a subset of the our arbitrary ball. REMEBER
;; both balls must have radius > 0, this makes a pile of difference

;; example:
;; f: (ℤ, d) ↦ (ℝ, d')
;; d - discrete metric
;; d' euclidian metric
;;
;;                         | ℝ real codomain
;;                         |
;;                         |               * f: x ↦ x
;;                         |            *
;;                         |         *
;;                         |      *
;;                         |   *
;;        .  .  .  .  .  .  *  .  .  .  .  .   ℤ integer domain
;;                       * |
;;                    *    |
;;                 *       |
;;
;; So is it continuous?
;; lets pick a point c and an arbitrary ball
;;
;;                         | ℝ real codomain
;;                         |
;;                         |               * f: x ↦ x
;;                         |            *
;;                         |      ^   *
;;                         |      *
;;                         |   *  ν c
;;        .  .  .  .  .  .  *  .  .  .  .  .   ℤ integer domain
;;                       * |
;;                    *    |
;;                 *       |
;;
;; Can we find a ball in the domain that when transformed will fit inside this
;; ball?
;; We remember that (ℤ,d) has the discrete metric, and that all points in
;; discrete space are their own open balls (as radius can be < 1) soooo
;;
;;                         | ℝ real codomain
;;                         |
;;                         |               * f: x ↦ x
;;                         |            *
;;                         |      ^   *
;;                         |     <*>    BOOM! (radius 0.5 would be valid example)
;;                         |   *  ν c
;;        .  .  .  .  .  .  *  .  .  .  .  .   ℤ integer domain
;;                       * |
;;                    *    |
;;                 *       |
;; I cant draw the transform as I'm limited by text.. still, you get the idea


;; continuity in general (video 7)
;; for a function be be continuous in general if it is continuous for every
;; point c in space X
;;
;; f is cts if f is cts at c ∀c ∈ X
;;
;; We are going to introduce an alternate equivalent definition of continuity:
;;
;; ⇔ means 'if and only if'
;;
;; Let (X,d) & (Y,d′) be metric spaces
;; f:x→y is cts ⇔ ∀ open sets V ⊆ Y f⁻¹(V) is open in X
;;
;; f⁻¹(_) is known as the 'pre-image', to be clear this means all the points in the
;; domain that map into that set
;;
;;
;;      X                      Y
;;      | ..U                  |
;;      | . .       f          |
;; _____|_._.__  ------>  ____.|_____
;;      | ..                .. |.V
;;      |                   ...|..
;;
;; so V is our open set in the codomain, and U is the points that map to V
;; to clarify V=f(U)  U=f⁻¹(V)   (V is the image of U) (U is the preimage of V)
;;
;; For any open set in the codomain (like V) if the preimage of that set is open
;; in the domain, then this is enough to prove continuity.
;;
;; What super cool about this version of the prood is that we dont need to talk
;; about the metric at all! this will turn out to be super powerful.


;;  Unions and Intersections of Open Sets in Metric Spaces (video 8)
;;
;; ∪ - union
;; ∩ - intersection
;; ∅ - empty set
;;
;; - ∅ is open as it has no elements to fail the condition of being an open set.
;; - A whole set X is open, because ∀x∈X any ball around x has to be ⊆ X
;;
;; Given two sets U & V that are open in X, then the intersection is open in X
;; Given two sets U & V that are open in X, then U ∩ V is open in X
;;
;; Given {open Uᵢ}i∈I (Which means a collection of sets indexed by i where i is
;;                     a member of some indexing set I (like the naturals or
;;                     something))
;; Where all Uᵢ are open
;; then ∪ Uᵢ is an open set. (union of all Uᵢ is open)
;;
;; HOWEVER whilst union holds for an arbitrary collection of open sets this is not
;; always the case for intersection. Whilst it is true for 2 (and thus for a
;; finite number of sets) it doesnt hold ofr an arbitrary


;; Topological Spaces (video 9)
;;
;; Let's define topology:
;; Given:
;; X - Set
;; τ - collection of subsets of X called the 'open sets'
;;     Right let's clarify some stuff as I didnt get the nuances of this and it
;;     screwed with my head for ages. Ok so τ is exhastive, by which I mean to
;;     be an open set you only need to be in τ, you do not need to be open with
;;     regard to a metric. Topologies are a generalization of the concepts we
;;     have been looking at so far.

;;
;; Now we take our theorums from above and turn them into axioms which will
;; define topology
;;
;; 1. ∅ ∈ τ         (remember τ isnt a superset, its a collection of sets. Also
;;    X ∈ τ          called the powerset and clearly X⊆X)
;;
;; 2. U,V ∈ τ => U ∩ V ∈ τ        (extends to any finite collection of sets)
;;
;; 3. {Uᵢ}(i∈I) ⊆ τ => ∪Uᵢ(i∈i) ∈ τ       (remember that each Uᵢ ∈ τ, but the
;;                                         collection is a subset)
;;
;;
;; Topological Space: (X, τ) where X is a set and τ is a topology on X
;;
;; Note the exist topology for which no metric can describe them so this is
;; quite the generalization on what we had.


;; Topology (video 10)
;;
;; Here's a valid topological space:
;; (X,τ)  τ = {∅, X}
;; This is known as the trivial topology and has no metric
;;
;; And another:
;; (X,τ) τ = PowerSet(X) - every subset of X is open as by definition τ is the
;;                         collection of open sets
;; Called the discrete topology because it's all sets are open in the discrete
;; metric
;;
;; Lets look at something that is not a topology.
;;
;; (X,τ) where X = {a b c}
;;             τ = {∅ {a b} {a c} {a b c}}
;;
;; so axiom 1 is a satisfied, but 2 breaks! Let's see how:
;; ok so it fails for {a b} ∩ {a c} as this gives {a}, but {a} ∉ τ
;; So no valid topology here
;;
;;
;; MORE!
;; (X, τ) where
;; X=ℝ
;; τ = {A ⊆ ℝ: 0∈A⇒A=ℝ} Collection of subsets of ℝ such that if 0 is in A then
;;                      that implies A is equal to the entire set.
;;                      (⇒ means implies)
;; So set (-∞ → -3) is a good set
;; but (-1 -> 1) is not as it includes 0 without being the entire set of ℝ
;; So it satisfies axiom 1
;; 2 is fine as the only set that contain 0 is the whole set and any
;; intersection would just be something not containing 0
;; 3 is also fine as the union of anything and ℝ is ℝ so its a topology!
;;


;; Metric Equivalence
;;
;; lets take two metrics in the same space
;; (X,d1) (X,d2)
;;
;; and we will say that
;; d1 induces τ1
;; d2 induces τ2
;;
;; now we can say that d1~d2 (d1 is equivalent to d2) if τ1=τ2
;;
;; hard to spot, could be infinite sets in τ*
;; However there is an equivalence that will allow us to catch a lot of these
;; equvilences quite easily. It wont allow us to get all of them but it will
;; allow us to get quite a few (it not a neccessary condition but is sufficient
;; to show two metrics are equivalent)
;;
;; d1~d2 if ∃ 2 positive constants i1 i2 s.t
;; ∀x ∈ X, ∀r>0
;; B¹ᵣᵢ₁ (x) ⊆ B²ᵣ(x) ⊆ B¹ᵣᵢ₂ (x)
;; if we can take a ball in the second metric with radius r around x, and then
;; can take a ball in metric 1 with radius r*i1 such that this balls fits inside
;; the first ball AND we can take a ball again in metric 1 but with radius
;; scaled by i2, such that the first ball fits inside this third ball THEN the
;; two metrics are equivalent


;; Continuity of functions between topological spaces (video 12)
;;
;; We want a generalized version that is sperate from the metric. We got fairly
;; far before, but the open sets were still defined by the metric. Now we have
;; topologies which are divorced from metrics, so let's see how we can talk
;; about continutity in this world.
;;
;; So given (X,τ1) & (Y,τ2) f is cts if
;; ∀ V ∈ τ2, f⁻¹(V) ∈ τ1
;; given an y set in the topology of the codomain then it's preimage in the in
;; topology of the domain.
;;
;; Phew! that is pretty simple with some big ol' implications, we will start
;; exploring those and see where it all goes.
;;
;; Implication 1. all constant functions are continuous
;; given c ∈ Y the function f(x) = c  ∀x∈X
;; Makes sense, right? the function always gives c for any value in the domain
;; which means for every point in the codomain (the set of only c in this case)
;; there is a preimage in the domain (all points in X, so the entire set X, and
;; by topology definition the entire set is an open set in the topology).
;;
;; Also if c ∉ Y then the preimage is ∅ which is also an open set in the
;; topology
;;
;; Implication 2.
;; The composition of any two continuous functions is cts
;; given:
;; (X,τx) (Y,τy) (Z,τz)
;; f: x->y  is cts
;; g: y->z  is cts
;; then g·f: x→z is cts
;;
;; proof:
;; let V ∈ τz   V is open and g is cts so g⁻¹(V) ∈ τy, but this is also an open
;; set as it's in τy and f is cts so f⁻¹(g⁻¹(V)) ∈ τx
;; DONE


;; Continuity examples
;;
;; Implication 3.
;; given a f:(X,τx)→(Y,τy)
;;
;; if τx is P(X) then f is cts        (P(_) is the powerset of _)
;; kinda cool right? for ANY function f this is true when τx is P(X)
;; (discrete topology)
;;
;; This is also true for the trivial topology
;;
;;
;; Examples
;; 1. Given (ℝ, τ)
;; where τ={(-a,a): a>0} ∪ {∅, ℝ} (t is every pair of non zero numbers, unioned
;;                                 with the full set and the empty set
;; and a f:(ℝ,τ)→(ℝ,τ) which takes x→x+1
;;
;; then given V=(-a,a) the preimage is f⁻¹(V) = (-a-1, a-1) which is not in the
;; topology, so f is not cts.
;;
;; given g:x → -x
;; g⁻¹(V) = (-a, a)  so g is cts
;;
;;
;; 2. Given (ℝ, σ) where σ={[0,b]:b>0}
;; so σ is every set of values beween 0 and b for any b
;; V=[0,b)
;; h:(ℝ,σ)→(ℝ,σ) x↦x²
;; then h⁻¹(V) = (-√b,√b) & (-√b,√b) ∉ σ so h is not cts in σ
;;                                    (remember that x² has two solutions for x)
;; However it is cts in τ :)


;; Closed Sets (video 14)
;;
;; Given (X,τ) & C ⊆ X               (remember that ⊆ emans C is a set)
;; then C is closed if X\C is open   (\ is set theory is the complement. The
;;                                    complement is everything not in the set)
;;
;; BIG warning, it is possible for Sets to be neither Open or Closed.. Even
;; crazier sounding it is possible for a Set to be BOTH Open and Closed!
;; The noobie mistake here is to say "A is not open, hence A is closed" WRONG!
;; More to come on all of this.
;;
;; Let's kick off with a cool example.
;; Here is our trivial topology τ={∅,X}
;; What are the open sets? Well the complement of ∅ is X, and the complement of
;; X is ∅. So there we are! Both ∅ and X are open and closed
;;
;; Here's another nice one, let's give X some points:
;; X={a,b}   so {a}⊂X and X\{a} = {b}
;; but neither {a} nor {b} are in the topology τ, so they are neither open nor
;; closed.
;; Cool!
;;
;; More! if τ=P(X) for any X then every c⊆X is open and closed


;; Properties of Closed Sets (Video 15)
;;
;; 1. ∅,X ∈ τ ⇒ ∅,X are closed
;;
;; 2. if C & D are closedi n X ⇒ C ∪ D is closed in X
;;    proof for this is that complement of closed is open, union of any two open
;;    is open, complement of that new open is closed.
;;
;; 3. given a family of closed sets {Cᵢ}(i∈I) then
;;    ∩Cᵢ(i∈I) is closed
;;
;;    POINT OF INTEREST: DeMorgan's Laws
;;    Given {Uᵢ}(i∈I)
;;    X\(∪Uᵢ(i∈I)) ⟺ ∩(X\Uᵢ)(i∈I)
;;    X\∩Uᵢ(i∈I) ⟺ ∪(X\Uᵢ)(i∈I)
;;
;; 4. Given (X,τ) (Y,σ) & f:x→y
;;    and C ⊆ X where C is closed in X
;;    then f is cts ≡ f⁻¹(C) is closed in X
;;
;;      X                      Y       So if V & U are open then the preimage of
;;      | ..U                  |       the complement of V must be the
;;      | . .       f          |       complement of U as the preimage of V is U
;; _____|_._.__  ------>  ____.|_____
;;      | ..                .. |.V
;;      |                   ...|..
;;
;;
;; Dumb thought of my own, if toplogy is a set of rules in terms of open sets
;; then the complement of topology is a subject in the same space in terms of
;; closed sets :D


;; Bases (video 16)
;;
;; 1. Given (X,τ) & B ⊆ τ then B is a basis for τ if
;;    ∀U∈τ, ∃{Bᵢ}(i∈I) ⊆ B s.t ∪Bᵢ(i∈I)=U
;;
;;    So B is a base if there exists a collection of sets in B such that their
;;    union is equal to U.
;;
;;    Even simpler, B is base of τ if it some union of it's members can make
;;    anything in τ
;;
;;    Note that B by definition is a set containing open sets
;;
;;
;;    One example of a base is the set of open balls in a metric space.
;;
;;    It's tempting to think about linear algrbra and in the 'spanning the
;;    space' sense they are kind of similar, however there is no equivalence of
;;    linear-independence .e.g a whole topology is a base for itself
;;
;; 2. A base forms a covering of X
;;    A 'Covering' is a family {Bᵢ}(i∈I) of subsets of X such that X⊆(uBi(i∈I))
;;    A base forming a covering is obvious as a base generates every possible
;;    subset.
;;
;; 3. Given two elements of the base B: B₁ & B₂ ∈ B then
;;    ∀x ∈ B₁ ∪ B₂ ∃ B₃ ∈ B s.t x ∈ B and B₃ ⊆ (B₁ ∩ B₂)
;;    Phew..
;;    - So B₁ & B₂ are open sets in the topology (as the are elements in B)
;;    - So their intersection is an open space
;;    - And so by defintion the basis must be able to generate that B₁ ∩ B₂
;;      space
;;    - So it either has to be the intersection itself or something that can be
;;      unioned to make the intersection space.


;; Subbase (video 17)
;;
;; S ⊆ τ s.t {∩Sⱼ(j∈J}: |J| < ∞} is a base for τ
;;
;; The '< ∞' is very important as we have to remember that our axioms for
;; topologies told us that infinte intersections may not be open but finite ones
;; will be.
;;
;; A with bases the whole topology is also a valid subbase, but this isnt useful
;;
;; For a given topology there isnt a unique subbase, but given a subbase there
;; is a unique topology that it generates.
;;
;; Examples
;; 1. Given: S = {(-∞, b): b∈ℝ} ∪ {(a,∞):a∈ℝ}
;;    lets say a < b and then let's take a example intersection in the subbase
;;    (-∞,b)∩(a,∞) = (a,b)
;;                     ↑ is any interval a,b and their ∪ is a valid base for S
;;                       so we are done
;;


;; Topological Distinguishablity
;;
;; Given τ1 & τ2
;; if τ1 ⊆ τ2 we say:
;; τ1 is courser (smaller,weaker) than τ2
;; τ2 is finer (larger,stronger) than τ1
;;
;; this is odd but lets think about it:
;;
;; in this case b and c are 'topologically indistinguishable' -------
;;                                                         --/       \--
;; our open sets have replace our concept of distance     /             \
;;                                                       /     -----     \
;; Now b & c may be difference algebraicly they just     |    (  x a)    |
;; arent topologically as the openset it 'too course'    \     -----   c /
;; to be able to say that                                 \             /
;;                                                         --\    b  /--
;; For example the trivial topology, our choice are ∅ or X    -------
;; so the representation is too course.
;;
;; Generally a courser set has more points that are topologically
;; indistinguishable.


;; Neighbourhood and Interior (Video 19)
;;
;; Given (X,τ) & c∈X, a neighbourhood is ANY Y⊆X which contains an open set
;; around the point c.
;;
;; More formally:
;; Neighbourhood of X is a set V where V⊆X s.t ∃U∈τ where U⊆V, c∈U
;;                                      ↑       ↑
;;                    not necessarily open     some open set
;;
;; misc points:
;; - in the discrete topology every point is a neighbourhood as every set is
;;   open
;; - in the trivial topology the only neighbourhood is the entire set
;; - we can have open and closed neighbourhoods. (an open one is itself an
;;   open set.
;;
;; Example:
;; [a, b) ⊆ ℝ         (half-closed interval in ℝ. Half close means it
;;                     includes a but not b)
;; This is not a neighbourhood of a, it's a neighbourhood of everything
;; else that's in it. The reason is that there is no open set containing a
;; that is contained in this set.
;;
;; Interior:
;; a point x∈V° (is in the interior of V) if there is a neighbourhood around
;; x that is itself inside V.
;;
;; x∈V° ∃ neighbourhood x N, s.t N⊆V
;;
;; So by defintion the interior is the union of all open-sets contain in V
;; given the family {Aᵢ}(i∈I) ⊆ τ, ∀i Aᵢ⊆V
;; V°=∪Aᵢ(i∈I)
;; and such the interior is also open


;; Neighbourhood Bases (video 20)
;;
;;
